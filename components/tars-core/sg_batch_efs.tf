resource "aws_security_group" "batch_efs" {
  name        = "${local.csi}-batch-efs"
  description = "${local.csi}-batch-efs"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-batch-efs"
    )
  )}"
}
