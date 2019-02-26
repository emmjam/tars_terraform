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
  # Total entries needed equals peers * nat route tables
  count                     = "${
    length(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id) * 
    length(aws_route_table.private_nat.*.id)
  }"

  # Modulo of index and nat route table count ensures that every
  # iteration wraps back between route table min and route table
  # max
  route_table_id            = "${element(aws_route_table.private_nat.*.id, (count.index % length(aws_route_table.private_nat.*.id)))}"
   
  # Divide the index by the route table count to get the current peering connection
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id, ceil(count.index / length(aws_route_table.private_nat.*.id)))}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.cidr_block, ceil(count.index / length(aws_route_table.private_nat.*.id)))}"
}

# For the public route table "public"
resource "aws_route" "public_pcx_ctrl_peers_xacct" {
  count                     = "${length(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id)}"
  route_table_id            = "${aws_route_table.public.id}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id, count.index)}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.cidr_block, count.index)}"
}
