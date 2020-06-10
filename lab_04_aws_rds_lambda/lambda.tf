data "archive_file" "rds_setup_zip" {
  type        = "zip"
  output_path = "rds_setup.zip"
  source_dir  = "rds_setup/"
}

data "template_file" "sql_script" {
  template = <<SQL
create database drmartin;
SQL
}

resource "aws_lambda_function" "rds_setup" {
  function_name     = "rds-setup"
  handler           = "index.handler"
  filename          = "rds_setup.zip"
  source_code_hash  = "${filesha256("rds_setup.zip")}"

  role              = "${aws_iam_role.rds_internal_lambda.arn}"
  runtime           = "nodejs12.x"
  timeout           = 10

  vpc_config {
    subnet_ids         = ["${aws_subnet.us-east-2a-public-ael.id}"]
    security_group_ids = ["${aws_security_group.server-web.id}"]
  }

  depends_on = ["aws_db_instance.default"]

  environment {
    variables = {
      PGPASSWORD = "${var.db_password}"
      PGUSER     = "${var.db_username}"
      PGNAMEBD   = "${var.db_name}"
      PGENDPONT  = "${aws_db_instance.default.endpoint}"
      SQL_SCRIPT = "${replace(trimspace(data.template_file.sql_script.rendered), "/\n/", " ")}"
    }
  }
}

resource "aws_iam_role" "rds_internal_lambda" {
  name = "RDSInternal"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "rds_internal" {
  name   = "RDSInternalNotifications"
  role   = "${aws_iam_role.rds_internal_lambda.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ],
    "Resource": "*"
  }]
}
EOF
}

resource "aws_iam_role_policy_attachment" "rds_lambda_vpc" {
  role       = "${aws_iam_role.rds_internal_lambda.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}