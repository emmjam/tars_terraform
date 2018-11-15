# Get the Messaging server AMI ID
data "aws_ami" "bobj" {
#  name_regex = "${format(
#    "%s-%s-%s/%s",
#    var.project,
#    "windows",
#    "wildfly-messaging",
#    "uat01_release_5.0.0.7"
#  )}"

  name_regex = "Windows_Server-2016-English-Full-Base-*"
  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
    "${var.mgmt_aws_account_id}",
    "amazon",
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}
