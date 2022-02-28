# CPC ALB target group for port 9443
resource "aws_alb_target_group" "cpc-front-internal-9443" {
  name     = "${local.csi}-internal-9443"
  port     = "9443"
  protocol = "HTTPS"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/cpctrain/ping"
    protocol            = "HTTPS"
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

resource "aws_alb_target_group" "cpc-front-internal2-9443" {
  name     = "${local.csi}-internal2-9443"
  port     = "9443"
  protocol = "HTTPS"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/cpctrain/ping"
    protocol            = "HTTPS"
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

#resource "aws_alb_target_group" "cpc-front-internal2-9443" {
# name     = "${local.csi}-internal2-9443"
# port     = "9443"
# protocol = "HTTPS"
# vpc_id   = data.terraform_remote_state.base.outputs.vpc_id
#
# health_check {
#   path                = "/cpctrain/ping"
#   protocol            = "HTTPS"
#   timeout             = 5
#   interval            = 10
#   healthy_threshold   = 3
#   unhealthy_threshold = 3
#   matcher             = 200
# }
#
# stickiness {
#   tpe    = "lb_cookie"
#   enabled = true
# }
#}