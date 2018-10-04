# SG for the TARS Public ALB
resource "aws_security_group" "tars-alb-public" {
  name        = "${local.csi}-tars-alb-public"
  description = "TARS ALB Public Facing"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars-alb-public"
    )
  )}"
}
