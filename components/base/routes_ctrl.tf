resource "aws_route" "public_ctrl" {
  route_table_id            = "${aws_route_table.public.id}"
  destination_cidr_block    = "${data.terraform_remote_state.ctrl.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}

resource "aws_route" "ctrl_private_nat_base" {
  route_table_id            = "${data.terraform_remote_state.ctrl.rt_private_nat_id}"
  destination_cidr_block    = "${aws_vpc.vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}

resource "aws_route" "ctrl_private_base" {
  route_table_id            = "${data.terraform_remote_state.ctrl.rt_private_id}"
  destination_cidr_block    = "${aws_vpc.vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}

resource "aws_route" "private_nat_ctrl" {
  count                     = "${length(var.squidnat_subnets_cidrs)}"
  route_table_id            = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block    = "${data.terraform_remote_state.ctrl.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}

resource "aws_route" "private_nonat_ctrl" {
  route_table_id            = "${aws_route_table.private_nonat.id}"
  destination_cidr_block    = "${data.terraform_remote_state.ctrl.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}

resource "aws_route" "private_natgw_ctrl" {
  route_table_id            = "${aws_route_table.private_natgw.id}"
  destination_cidr_block    = "${data.terraform_remote_state.ctrl.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}
