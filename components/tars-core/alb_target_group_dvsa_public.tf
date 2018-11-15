# ALB Target group for TARS frontend port 8443
resource "aws_alb_target_group" "tars-dvsa-public-8443" {
  name     = "${local.csi}-dvsa-8443"
  port     = "8443"
  protocol = "HTTPS"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/DSAWeb/health_check.jsp"
    protocol            = "HTTPS"
    timeout             = 5
    interval            = 300
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
}
