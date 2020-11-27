# Get the wildfly batch AMI ID
data "aws_ami" "fyndi-f" {
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
        "fyndi-front",
        var.fyndi_ami_id,
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

data "aws_ami" "fyndi-b" {
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
        "fyndi-back",
        var.fyndi_ami_id,
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

