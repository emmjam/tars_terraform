resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/public"
    )
  )}"
}
