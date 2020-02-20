# Get the wildfly batch AMI ID
data "aws_ami" "fyndi-f" {
  name_regex = format(
    "%s-%s-%s/%s$",
    var.project,
    "amzn",
    "fyndi-front",
    var.fyndi_ami_id,
  )

  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
    var.mgmt_aws_account_id,
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

data "aws_ami" "fyndi-b" {
  name_regex = format(
    "%s-%s-%s/%s$",
    var.project,
    "amzn",
    "fyndi-back",
    var.fyndi_ami_id,
  )

  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
    var.mgmt_aws_account_id,
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

