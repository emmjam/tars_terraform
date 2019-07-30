resource "aws_alb_target_group" "tars-backend-payments-8080" {
  name       = "${local.csi}-payments"
  port       = "8080"
  protocol   = "HTTP"
  vpc_id     = "${data.terraform_remote_state.base.vpc_id}"
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

