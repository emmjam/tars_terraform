resource "aws_alb_target_group" "reporting_xe_8443" {
  count = var.reporting_xe_count

  vpc_id = aws_vpc.vpc.id
  name   = format("%s-%s-%s", var.project, var.environment, "reporting-xe-8443")

  protocol             = "HTTPS"
  port                 = "8443"
  deregistration_delay = "300"

  stickiness {
    enabled = false

    type            = "lb_cookie"
    cookie_duration = "86400"
  }

  health_check {
    matcher = "200"
    path    = "/healthcheck.html"

    protocol            = "HTTPS"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
