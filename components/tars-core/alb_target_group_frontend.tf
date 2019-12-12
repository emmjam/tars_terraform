# ALB Target group for TARS frontend port 8443
resource "aws_alb_target_group" "tars-frontend-8443" {
  name     = "${local.csi}-wff-8443"
  port     = "8443"
  protocol = "HTTPS"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/DSAWeb/health_check.jsp"
    protocol            = "HTTPS"
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

# TODO: peacheym: Move to an irdt component, or rename
#                 to local.csi-irdt-wff-7443
# ALB Target group for TARS frontend port 7443 - External IRDT
resource "aws_alb_target_group" "irdt-frontend-7443" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "irdt",
    "wff-7443",
  )

  port     = "7443"
  protocol = "HTTPS"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/DSAWeb/health_check.jsp"
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

