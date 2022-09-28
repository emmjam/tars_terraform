resource "aws_lb_listener" "jenkins-nlb-8080" {
  load_balancer_arn = aws_lb.jenkins_nlb.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_nlb.arn
  }
}

resource "aws_lb_listener" "jenkins-nlb-49187" {
  load_balancer_arn = aws_lb.jenkins_nlb.arn
  port              = "49187"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_nlb.arn
  }
}