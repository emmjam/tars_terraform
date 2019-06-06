resource "aws_security_group" "fyndi-b_aurora" {
  name        = "${local.csi}/fyndi-b-db"
  description = "${local.csi}/fyndi-b-db"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/fyndi-b-db"
    )
  )}"
}
