resource "aws_security_group" "alb_private" {
  name        = "${local.csi}-alb-private"
  description = "Common SG for private ALB"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-alb-private"
    )
  )}"
}
