# ALB Listener for TARS Messaging port 8080
resource "aws_alb_listener" "tars-messaging-8080" {
  load_balancer_arn = aws_alb.tars-alb-messaging-private.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tars-messaging-8080.arn
  }
}

# ALB Listener for TARS Messaging port 443
resource "aws_alb_listener" "tars-messaging-443" {
  load_balancer_arn = aws_alb.tars-alb-messaging-private.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tars-messaging-80.arn
  }
}

