resource "aws_route" "internet_public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.mgmt.id}"
}

resource "aws_route" "internet_private" {
  route_table_id         = "${aws_route_table.private_nat.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.mgmt.id}"
}

