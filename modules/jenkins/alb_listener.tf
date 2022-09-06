resource "aws_alb_listener" "jenkins-8080" {
  load_balancer_arn = aws_alb.jenkins.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.jenkins.arn
  }
}

resource "aws_alb_listener" "jenkins-49187" {
  load_balancer_arn = aws_alb.jenkins.arn
  port              = "49187"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.jenkins.arn
  }
}