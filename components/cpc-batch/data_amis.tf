data "aws_ami" "cpc-batch" {
  name_regex = format(
    "%s-%s-%s/%s$",
    var.project,
    "amzn",
    "cpc-batch",
    var.cpc_ami_id,
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

