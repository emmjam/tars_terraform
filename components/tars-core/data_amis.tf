data "aws_ami" "wildfly-back" {
  name_regex = "${format(
    "%s-%s-%s/%s*",
    var.project,
    "rhel",
    "tars-back",
    var.ami_build_id
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

data "aws_ami" "wildfly-front" {
  name_regex = "${format(
    "%s-%s-%s/%s*",
    var.project,
    "rhel",
    "tars-front",
    var.ami_build_id
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

data "aws_ami" "apache" {
  name_regex = "${format(
    "%s-%s-%s/%s*",
    var.project,
    "amzn",
    "apache-routing",
    var.apache_ami_build_id
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
