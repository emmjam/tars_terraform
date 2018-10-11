resource "aws_security_group" "fyndi-b" {
  name        = "${local.csi}/fyndi-b"
  description = "${local.csi}/fyndi-b"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/fyndi-b"
    )
  )}"
}
