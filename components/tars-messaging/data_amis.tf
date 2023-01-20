# Get the Messaging server AMI ID
data "aws_ami" "wildfly-messaging" {
  name_regex = format(
    "%s-%s-%s/%s",
    var.project,
    "windows",
    "wildfly-messaging",
    var.wildfly_messaging_id,
  )

  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
    var.mgmt_aws_account_id,
    var.nonprod_aws_account_id,
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

