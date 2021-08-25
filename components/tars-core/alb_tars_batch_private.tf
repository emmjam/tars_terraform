# TARS Batch ALB 
resource "aws_alb" "tars-alb-batch-private" {
  name     = "${local.csi}-batch"
  internal = true

  security_groups = [
    aws_security_group.tars-alb-batch.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_backend_elb

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/batch-private"
    },
  )
}

