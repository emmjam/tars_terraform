resource "aws_alb_target_group" "apache-80" {
  name     = "${local.csi}-apache-80"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/healthcheck.html"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}
