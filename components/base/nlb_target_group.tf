resource "aws_lb_target_group" "jenkins_nlb" {
  name     = "${var.project}-${var.environment}-${var.component}-nlb"
  port     = "8080"
  protocol = "TCP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    protocol            = "HTTPS"
    healthy_threshold   = var.elb_healthy_threshold
    unhealthy_threshold = var.elb_unhealthy_threshold
    timeout             = 10 #var.elb_healthcheck_timeout
    interval            = 30 #var.elb_healthcheck_interval
    path                = "/login"
    matcher             = "200,399"
  }
}