data "aws_ami" "wildfly-back" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "rhel",
    "wildfly11-back",
    "${var.ami_build_id}"
  )}"

  most_recent = "true"
  #owners      = ["${data.aws_caller_identity.current.account_id}"]

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "wildfly-front" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "rhel",
    "wildfly11-front",
    "${var.ami_build_id}"
  )}"

  most_recent = "true"
  #owners      = ["${data.aws_caller_identity.current.account_id}"]

  filter {
    name   = "state"
    values = ["available"]
  }
}
