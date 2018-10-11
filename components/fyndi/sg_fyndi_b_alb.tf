resource "aws_security_group" "fyndi-b-alb" {
  name        = "${local.csi}/fyndi-b-alb"
  description = "${local.csi}/fyndi-b-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/fyndi-b-alb"
    )
  )}"
}
