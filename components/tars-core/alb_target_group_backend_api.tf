# ALB Target Group for Wildfly private backend api on port 8080
resource "aws_alb_target_group" "tars-backend-api-8080" {
  name       = "${local.csi}-wfapi-8080"
  port       = "8080"
  protocol   = "HTTP"
  vpc_id     = data.terraform_remote_state.base.outputs.vpc_id
  slow_start = 300

  health_check {
    # Replace with MES API
    path                = "/DSAAuthenticationService/DSAAuthenticationJWSService?wsdl"
    timeout             = 5
    interval            = 300
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

