resource "aws_security_group" "build" {
  name        = "${local.csi}-build"
  description = "Common SG for build instances"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-build"
    )
  )}"
}
