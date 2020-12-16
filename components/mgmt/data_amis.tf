data "aws_ami" "jenkins" {
  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
  ]
  
  filter {
    name = "name"

    values = [
      format(
        "%s-%s-%s/%s",
        var.project,
        "amzn",
        "jenkins",
        var.jenkins_ami_build_id,
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

data "aws_ami" "sonarqube" {
  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
  ]

  filter {
    name = "name"

    values = [
      format(
        "%s-%s-%s/%s",
        var.project,
        "amzn",
        "sonarqube",
        "571",
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

data "aws_ami" "gitlab" {
  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
  ]

  filter {
    name = "name"

    values = [
      format(
        "%s-%s-%s/%s",
        var.project,
        "amzn",
        "gitlab",
        var.gitlab_ami_build_id,
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

data "aws_ami" "gitlab_amzn2" {
  name_regex = format(
    "%s-%s-%s/%s",
    var.project,
    "amzn2",
    "gitlab",
    var.gitlab_amzn2_ami_build_id,
  )

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

data "aws_ami" "nexus" {
  most_recent = "true"

  owners = [
    data.aws_caller_identity.current.account_id,
  ]

  filter {
    name = "name"

    values = [
      format(
        "%s-%s-%s/%s",
        var.project,
        "amzn",
        "nexus",
        var.nexus_config["nexus_ami_build_id"],
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

