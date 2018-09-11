# sftplus Server internal
resource "aws_lb" "mock-nlb" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "mock-nlb"
  )}"

  internal = true
  subnets = ["${data.terraform_remote_state.base.subnets_tars_backend}"]

  load_balancer_type = "network"

  idle_timeout = "300"

  enable_deletion_protection = true

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "mock"
      ),
    )
  )}"
}

