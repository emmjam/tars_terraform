# SG for TARS Batch ALB
resource "aws_security_group" "tars-alb-batch" {
  name        = "${local.csi}-tars-alb-batch"
  description = "TARS ALB Batch"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-alb-batch"
    },
  )
}

