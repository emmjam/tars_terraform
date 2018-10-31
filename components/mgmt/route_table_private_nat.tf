resource "aws_route_table" "private_nat" {
  vpc_id = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/private-nat"
    )
  )}"
}
