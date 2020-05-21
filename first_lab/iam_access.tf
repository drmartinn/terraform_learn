# resource "aws_iam_group" "admin" {
#   name = "Admin"
# }

# resource "aws_iam_policy_attachment" "policy_admin_attach" {
#   name       = "admins_attach"
#   groups     = ["${aws_iam_group.admin.name}"]
#   policy_arn = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
# }

# resource "aws_iam_user" "admin" {
#   name = "admin"
# }

# resource "aws_iam_group_membership" "admin_users" {
#   name = "admin_users"
#   users = [
#     "${aws_iam_user.admin.name}"
#   ]
#   group = "${aws_iam_group.admin.name}"
# }

# resource "aws_iam_access_key" "acces_key_admin" {
#   user = "${aws_iam_user.admin.name}"
# }

# output "admin_access_key" {
#   value = "${aws_iam_access_key.acces_key_admin.id}"
# }

# output "admin_secret_key" {
#   value = "${aws_iam_access_key.acces_key_admin.secret}"
# }


