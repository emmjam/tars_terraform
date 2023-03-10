resource "aws_security_group" "apache_alb_public" {
  name        = "${local.csi}-apache-alb-public"
  description = "Apache ALB Public Facing"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/apache-alb-public"
    },
  )
}

