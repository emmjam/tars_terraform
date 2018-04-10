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

# # base-dev01-pcx
# resource "aws_route" "base-dev01-pcx_private" {
#   count                     = "${length(var.dev01_peers)}"
#   route_table_id            = "${aws_route_table.private.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.dev01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.dev01_peers.*.id, count.index)}"
# }

# # base-opsdev-pcx
# resource "aws_route" "base-opsdev-pcx_private" {
#   count                     = "${length(var.opsdev_peers)}"
#   route_table_id            = "${aws_route_table.private.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.id, count.index)}"
# }

# # base-sit01-pcx
# resource "aws_route" "base-sit01-pcx_private" {
#   count                     = "${length(var.sit01_peers)}"
#   route_table_id            = "${aws_route_table.private.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.sit01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.sit01_peers.*.id, count.index)}"
# }

# # base-uat01-pcx
# resource "aws_route" "base-uat01-pcx_private" {
#   count                     = "${length(var.uat01_peers)}"
#   route_table_id            = "${aws_route_table.private.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.uat01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.uat01_peers.*.id, count.index)}"
# }
