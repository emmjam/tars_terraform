data "aws_ami" "bastion" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "bastion",
    "${lookup(var.bastion,"ami_build_id")}"
  )}"

  most_recent = "true"
  owners      = ["${data.aws_caller_identity.current.account_id}"]

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "jenkins" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "jenkins",
    "${lookup(var.jenkins,"ami_build_id")}"
  )}"

  most_recent = "true"
  owners      = ["${data.aws_caller_identity.current.account_id}"]

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "jenkinsnode" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "jenkinsnode",
    "${lookup(var.jenkinsnode,"ami_build_id")}"
  )}"

  most_recent = "true"
  owners      = ["${data.aws_caller_identity.current.account_id}"]

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "gitlab" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "gitlab",
    "${lookup(var.gitlab,"ami_build_id")}"
  )}"

  most_recent = "true"
  owners      = ["${data.aws_caller_identity.current.account_id}"]

  filter {
    name   = "state"
    values = ["available"]
  }
}
