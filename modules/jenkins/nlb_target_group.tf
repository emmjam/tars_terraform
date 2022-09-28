resource "aws_lb_target_group" "jenkins_nlb" {
  name     = "${var.project}-${var.environment}-${var.component}-${var.name}"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = var.elb_healthy_threshold
    unhealthy_threshold = var.elb_unhealthy_threshold
    timeout             = var.elb_healthcheck_timeout
    interval            = var.elb_healthcheck_interval
    path                = "/login"
    matcher             = 200
  }
}