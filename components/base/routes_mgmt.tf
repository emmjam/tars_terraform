resource "aws_route" "public_mgmt" {
  route_table_id            = "${aws_route_table.public.id}"
  destination_cidr_block    = "${data.terraform_remote_state.mgmt.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

resource "aws_route" "private_nat_mgmt" {
  count                     = "${length(var.squidnat_subnets_cidrs)}"
  route_table_id            = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block    = "${var.mgmt_vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

