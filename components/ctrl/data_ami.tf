data "aws_ami" "jenkinsctrl" {
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
}

data "aws_ami" "bastion" {
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

  filter {
    name = "name"

    values = [
      format(
        "%s-%s-%s/%s",
        var.project,
        "amzn2",
        "bastion",
        var.bastion_ami_build_id,
      )
    ]
  }
}

data "aws_ami" "grafana" {
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

  filter {
    name = "name"

    values = [
      format(
        "%s-%s-%s/%s",
        var.project,
        "amzn2",
        "grafana",
        var.grafana_ami_build_id,
      )
    ]
  }
}

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
