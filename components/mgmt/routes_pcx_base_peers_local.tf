##
# Routing Table Routes from mgmt_prd to base VPCs
##

# For the private route table "private"
resource "aws_route" "private_pcx_base_peers_local" {
  count                     = "${length(data.aws_vpc_peering_connection.base_peers_local.*.id)}"
  route_table_id            = "${aws_route_table.private.id}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.base_peers_local.*.id, count.index)}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.base_peers_local.*.cidr_block, count.index)}"
}

resource "aws_route" "private_nat_pcx_base_peers_local" {
  count                     = "${length(data.aws_vpc_peering_connection.base_peers_local.*.id)}"
  route_table_id            = "${aws_route_table.private_nat.id}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.base_peers_local.*.id, count.index)}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.base_peers_local.*.cidr_block, count.index)}"
}

# For the public route table "public"
resource "aws_route" "public_pcx_base_peers_local" {
  count                     = "${length(data.aws_vpc_peering_connection.base_peers_local.*.id)}"
  route_table_id            = "${aws_route_table.public.id}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.base_peers_local.*.id, count.index)}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.base_peers_local.*.cidr_block, count.index)}"
}
