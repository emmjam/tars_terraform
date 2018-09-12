
resource "aws_lb_target_group" "mock-nlb" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "22"
  )}"
  port     = "22"
  protocol = "TCP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    port                = "traffic-port"
    protocol            = "TCP"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
    interval            = "10"
  }

  target_type = "instance"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "mock"
      )
    )
  )}"

}


