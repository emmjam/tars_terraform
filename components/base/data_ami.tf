# Get the jenkinsnode AMI id
data "aws_ami" "jenkinsnode" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "jenkinsnode",
    var.jenkinsnode_ami_build_id
  )}"

  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
    "${var.mgmt_aws_account_id}",
  ]

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "squidnat" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "squidnat",
    "*"
  )}"

  most_recent = "true"
  owners      = [
    "${data.aws_caller_identity.current.account_id}",
    "${var.mgmt_aws_account_id}",
  ]

  filter {
    name   = "state"
    values = ["available"]
  }
}

