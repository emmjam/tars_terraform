data "aws_ami" "jenkinsctrl" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "jenkinsnode",
    var.jenkinsctrl_ami_build_id
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

data "aws_ami" "bastion" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "bastion",
    var.bastion_ami_build_id
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

data "aws_ami" "grafana" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "grafana",
    var.grafana_ami_build_id
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
