# Get the Messaging server AMI ID
data "aws_ami" "wildfly-messaging" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "windows",
    "wildfly-messaging",
    "${var.ami_build_id}"
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
