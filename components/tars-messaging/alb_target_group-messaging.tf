# ALB target group for messaging port 8080
resource "aws_alb_target_group" "tars-messaging-8080" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "msg",
    "8080"
  )}"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

}

# ALB target group for messaging port 80
resource "aws_alb_target_group" "tars-messaging-80" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "msg",
    "80"
  )}"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

}