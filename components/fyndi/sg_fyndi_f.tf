resource "aws_security_group" "fyndi-f" {
  name        = "${local.csi}/fyndi-f"
  description = "${local.csi}/fyndi-f"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/fyndi-f"
    )
  )}"
}
