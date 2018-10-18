resource "aws_route" "internet_private" {
  route_table_id         = "${aws_route_table.private_nat.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.ctrl.*.id,count.index)}"
}

resource "aws_route" "private_nat_mgmt" {
  count                     = "${length(var.ctrl_nat_subnets_cidrs)}"
  route_table_id            = "${aws_route_table.private_nat.id}"
  destination_cidr_block    = "${data.terraform_remote_state.mgmt.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}
