data "aws_ami" "jenkinsnode" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "jenkinsnode",
    "${lookup(var.jenkinsnode,"ami_build_id")}"
  )}"

  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
    "${lookup(var.mgmt,"aws_account_id")}",
  ]

  filter {
    name   = "state"
    values = ["available"]
  }
}
