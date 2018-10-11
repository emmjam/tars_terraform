resource "aws_security_group" "fyndi-f-alb" {
  name        = "${local.csi}/fyndi-f-alb"
  description = "${local.csi}/fyndi-f-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/fyndi-f-alb"
    )
  )}"
}
