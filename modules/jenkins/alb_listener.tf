resource "aws_alb_listener" "jenkins-8080" {
  load_balancer_arn = aws_alb.jenkins.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

resource "aws_alb_listener" "jenkins-49187" {
  load_balancer_arn = aws_alb.jenkins.arn
  port              = "49187"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}