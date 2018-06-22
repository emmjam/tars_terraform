# Get the wildfly batch AMI ID
data "aws_ami" "cpc-front" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "rhel",
    "cpc-front",
    var.ami_build_id
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

data "aws_ami" "cpc-back" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "rhel",
    "cpc-back",
    var.ami_build_id
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

