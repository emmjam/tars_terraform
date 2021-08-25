resource "aws_security_group" "cpc_batch_efs" {
  name        = "${local.csi}-cpc-batch-efs"
  description = "${local.csi}-cpc-batch-efs"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-cpc-batch-efs"
    },
  )
}

