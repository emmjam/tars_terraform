resource "aws_alb_target_group" "public_default" {
  name     = "default-public"
  port     = "443"
  protocol = "HTTPS"
  vpc_id   = "${aws_vpc.mgmt.id}"
}

resource "aws_alb_target_group" "jenkins" {
  name     = "jenkins"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.mgmt.id}"

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}
