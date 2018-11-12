resource "aws_security_group" "tars-alb-internal" {
  name        = "${local.csi}-tars-alb-internal"
  description = "TARS ALB Internal"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars-alb-internal"
    )
  )}"
}
