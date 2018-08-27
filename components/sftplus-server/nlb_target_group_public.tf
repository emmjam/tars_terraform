
resource "aws_lb_target_group" "sftpplus_svr-543" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "543"
  )}"
  port     = "543"
  protocol = "TCP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  target_type = "instance"

  health_check {
    port                = "traffic-port"
    protocol            = "TCP"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
    interval            = "10"
  }

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "sftpplus-svr"
      )
    )
  )}"

}
