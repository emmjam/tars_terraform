# Get the wildfly batch AMI ID
data "aws_ami" "obs" {
  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
    var.mgmt_aws_account_id,
  ]

  filter {
    name = "name"

    values = [
      format(
        "%s-%s-%s/%s",
        var.project,
        "amzn2",
        "obs",
        var.obs_ami_id
      )
    ]
  }

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

