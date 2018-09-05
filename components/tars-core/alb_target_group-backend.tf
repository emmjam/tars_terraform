# ALB Target Group for Wildfly private backend on port 8080
resource "aws_alb_target_group" "tars-backend-8080" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "wfb-8080"
  )}"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/DSAAuthenticationcationJWSService?wsdl"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

}
