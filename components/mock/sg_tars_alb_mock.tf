# SG for TARS mock ALB
resource "aws_security_group" "tars-alb-mock" {
  name        = "${local.csi}-tars-alb-mock"
  description = "TARS ALB mock"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-tars-alb-mock"
    )
  )}"
}
