# TARS Batch AB target group for port 80 ALB
resource "aws_alb_target_group" "ibs-80" {
  count    = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  name     = "${local.csi}-ibs-tars-80"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/healthcheck.html"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}