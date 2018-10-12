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
    name = "state"

    values = [
      "available",
    ]
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

  owners = [
    "${data.aws_caller_identity.current.account_id}",
    "${var.mgmt_aws_account_id}",
  ]

  filter {
    name   = "state"

    values = [
      "available",
    ]
  }
}

data "aws_ami" "jmeter" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "jmeter",
    "*"
  )}"

  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
    "${var.mgmt_aws_account_id}",
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

data "aws_ami" "prometheus" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "prometheus",
    var.prometheus_ami_build_id
  )}"

  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
    "${var.mgmt_aws_account_id}",
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

data "aws_ami" "efs_backup" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "efs-backup",
    var.efs_backup_ami_build_id
  )}"

  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
    "${var.mgmt_aws_account_id}",
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}
