# TARS Batch AB target group for port 8080
resource "aws_alb_target_group" "obs-8080" {
  name     = "${local.csi}-obs"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/obs-web/kpi/systemAvailability"
    timeout             = 5
    interval            = 300
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
}

