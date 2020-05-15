# Get the wildfly batch AMI ID
data "aws_ami" "cpc-front" {
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
        "amzn",
        "cpc-front",
        var.cpc_ami_id
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

data "aws_ami" "cpc-back" {
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
        "amzn",
        "cpc-back",
        var.cpc_ami_id
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

