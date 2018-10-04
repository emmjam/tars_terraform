# SG for the messaging server
resource "aws_security_group" "tars-messaging" {
  name        = "${local.csi}-tars-messaging"
  description = "TARS Messaging"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars-messaging"
    )
  )}"
}
