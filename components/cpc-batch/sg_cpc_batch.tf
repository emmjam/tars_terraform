resource "aws_security_group" "cpc_batch" {
  name        = "${local.csi}-cpc-batch"
  description = "${local.csi}-cpc-batch"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-cpc-batch"
    )
  )}"
}
