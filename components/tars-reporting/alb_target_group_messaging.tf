# ALB target group for bobj port 8080
resource "aws_alb_target_group" "bobj-8080" {
  name = format("%s-%s-%s-%s", var.project, var.environment, "bobj", "8080")

  port     = "8080"
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/BOE/BI"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

