resource "aws_alb_listener" "grafna-https" {
  count             = "${var.account_environment != "mgmt" ? 1 : 0}"
  load_balancer_arn = aws_alb.grafana.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.grafana_acm[count.index].arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.grafana-80[count.index].arn
  }
}

