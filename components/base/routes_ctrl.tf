resource "aws_route" "public_ctrl" {
  route_table_id            = "${aws_route_table.public.id}"
  destination_cidr_block    = "${data.terraform_remote_state.ctrl.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}

