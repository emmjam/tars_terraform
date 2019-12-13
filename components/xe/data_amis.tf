# Get the wildfly batch AMI ID
data "aws_ami" "oraclexe" {
  name_regex = var.xe_ami_name

  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

