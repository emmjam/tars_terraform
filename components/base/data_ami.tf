# Get the jenkinsnode AMI id
/*data "aws_ami" "jenkinsnode" {

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
        var.jenkinsnode_ami_build_id,
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
*/
data "aws_ami" "squidnat" {
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
        "squidnat",
        var.squidnat_ami_build_id,
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

data "aws_ami" "jmeter" {
  
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
        "jmeter",
        var.jmeter_ami_build_id,
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

data "aws_ami" "prometheus" {
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
        "prometheus",
        var.prometheus_ami_build_id,
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

