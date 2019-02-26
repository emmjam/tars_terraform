##
# Routing Table Routes from mgmt_prd to ctrl VPCs
##

# For the private route table "private"
resource "aws_route" "private_pcx_ctrl_peers_xacct" {
  count                     = "${length(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id)}"
  route_table_id            = "${aws_route_table.private.id}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id, count.index)}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.cidr_block, count.index)}"
}

resource "aws_route" "private_nat_pcx_ctrl_peers_xacct" {
  count                     = "${length(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id)}"
  route_table_id            = "${element(aws_route_table.private_nat.*.id, 1)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id, count.index)}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.cidr_block, count.index)}"
}

# For the public route table "public"
resource "aws_route" "public_pcx_ctrl_peers_xacct" {
  count                     = "${length(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id)}"
  route_table_id            = "${aws_route_table.public.id}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id, count.index)}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.cidr_block, count.index)}"
}
