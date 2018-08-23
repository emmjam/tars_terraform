# ALB Target group for TARS frontend-private port 8443
resource "aws_alb_target_group" "tars-frontend-private-8443" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "prv-8443"
  )}"

  port     = "8443"
  protocol = "HTTPS"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/"
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

