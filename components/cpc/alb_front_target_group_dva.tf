# CPC ALB target group for port 7443
resource "aws_alb_target_group" "cpc-front-dva-7443" {
  name     = "${local.csi}-dva-7443"
  port     = "7443"
  protocol = "HTTPS"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/cpctrain/ping"
    protocol            = "HTTPS"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

  stickiness {
    type = "lb_cookie"
    enabled = true
  }
}
