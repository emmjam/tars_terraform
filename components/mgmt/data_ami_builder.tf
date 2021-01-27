data "aws_ami" "builder" {
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
        "jenkinsnode",
        var.jenkinsctrl_ami_build_id,
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

