# Get the wildfly mock AMI ID
data "aws_ami" "wildfly-mock" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "rhel",
    "wildfly11-mock",
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
