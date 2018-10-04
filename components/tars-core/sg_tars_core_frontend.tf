resource "aws_security_group" "tars-core-frontend" {
  name        = "${local.csi}-tars-core-frontend"
  description = "TARS Core Frontend"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars-core-frontend"
    )
  )}"
}
