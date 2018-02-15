resource "aws_route" "internet_public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.ctrl.id}"
}

resource "aws_route" "internet_private" {
  count                  = "${length(var.ctrl_nat_subnets_cidrs)}"
  route_table_id         = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.ctrl.*.id,count.index)}"
}
