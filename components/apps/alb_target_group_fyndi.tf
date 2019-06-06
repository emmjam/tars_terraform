# TARS Batch AB target group for port 8080
resource "aws_alb_target_group" "fyndi-f-8080" {
  name     = "${local.csi}-front-8080"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/DSAFindNearestWebApp/findNearest.form"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
}

resource "aws_alb_target_group" "fyndi-b-8080" {
  name     = "${local.csi}-back-8080"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/DSAFindNearestService/services/findNearest.wsdl"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}
