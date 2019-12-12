# ALB Target Group for Wildfly private backend on port 8080
resource "aws_alb_target_group" "tars-backend-8080" {
  name       = "${local.csi}-wfb-8080"
  port       = "8080"
  protocol   = "HTTP"
  vpc_id     = data.terraform_remote_state.base.outputs.vpc_id
  slow_start = 300

  health_check {
    path                = "/DSAAuthenticationService/DSAAuthenticationJWSService?wsdl"
    timeout             = 5
    interval            = 300
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

