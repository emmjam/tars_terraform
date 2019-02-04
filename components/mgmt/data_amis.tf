data "aws_ami" "jenkins" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "jenkins",
    var.jenkins_ami_build_id
  )}"

  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

data "aws_ami" "gitlab" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "gitlab",
    var.gitlab_ami_build_id
  )}"

  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}

data "aws_ami" "nexus" {
  name_regex = "${format(
    "%s-%s-%s/%s",
    var.project,
    "amzn",
    "nexus",
    "${lookup(var.nexus_config, "nexus_ami_build_id")}"
  )}"

  most_recent = "true"

  owners = [
    "${data.aws_caller_identity.current.account_id}",
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}
