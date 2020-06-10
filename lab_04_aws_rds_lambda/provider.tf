provider "aws" {
    region = "${var.region}"
}
provider "archive" {
  version = "~> 1.1"
}