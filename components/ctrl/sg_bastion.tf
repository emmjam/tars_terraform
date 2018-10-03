resource "aws_security_group" "bastion" {
  name        = "${local.csi}-bastion"
  description = "SG for the ctrl Bastion server"
  vpc_id      = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/bastion"
    )
  )}"
}
