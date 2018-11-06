resource "aws_security_group" "nexus_efs" {
  name        = "${local.csi}-nexus-efs"
  description = "${local.csi}-nexus-efs"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-nexus-efs"
    )
  )}"
}
