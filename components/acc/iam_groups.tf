resource "aws_iam_group" "all_users" {
  name = "AllUsers"
  path = "/"
}

resource "aws_iam_group" "administrators" {
  name = "Administrators"
  path = "/"
}

resource "aws_iam_group" "power_users" {
  name  = "PowerUsers"
  path  = "/"
}

resource "aws_iam_group" "ops" {
  name  = "${local.csi}ops"
  path  = "/"
}

