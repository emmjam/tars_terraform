# SG for the TARS DVSA Public ALB
resource "aws_security_group" "tars-dvsa-public" {
  name        = "${local.csi}-tars-alb-dvsa-public"
  description = "TARS ALB DVSA Public"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars-dvsa-public"
    )
  )}"
}
