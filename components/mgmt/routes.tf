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

# # base-dev01-pcx
# resource "aws_route" "base-dev01-pcx_private" {
#   count                     = "${length(var.dev01_peers)}"
#   route_table_id            = "${aws_route_table.private.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.dev01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.dev01_peers.*.id, count.index)}"
# }

# # TODO: replace with one declaration
# resource "aws_route" "base_dev01_pcx_private_nat_0" {
#   count                     = "${length(var.dev01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.0.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.dev01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.dev01_peers.*.id, count.index)}"
# }

# resource "aws_route" "base_dev01_ctrl_pcx_private_nat_1" {
#   count                     = "${length(var.dev01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.1.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.dev01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.dev01_peers.*.id, count.index)}"
# }

# resource "aws_route" "base_dev01_ctrl_pcx_private_nat_2" {
#   count                     = "${length(var.dev01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.2.id}"
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

# # TODO: replace with one declaration
# resource "aws_route" "base_opsdev_pcx_private_nat_0" {
#   count                     = "${length(var.opsdev_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.0.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.id, count.index)}"
# }

# resource "aws_route" "base_opsdev_ctrl_pcx_private_nat_1" {
#   count                     = "${length(var.opsdev_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.1.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.id, count.index)}"
# }

# resource "aws_route" "base_opsdev_ctrl_pcx_private_nat_2" {
#   count                     = "${length(var.opsdev_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.2.id}"
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

# # TODO: replace with one declaration
# resource "aws_route" "base_sit01_pcx_private_nat_0" {
#   count                     = "${length(var.sit01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.0.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.sit01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.sit01_peers.*.id, count.index)}"
# }

# resource "aws_route" "base_sit01_ctrl_pcx_private_nat_1" {
#   count                     = "${length(var.sit01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.1.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.sit01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.sit01_peers.*.id, count.index)}"
# }

# resource "aws_route" "base_sit01_ctrl_pcx_private_nat_2" {
#   count                     = "${length(var.sit01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.2.id}"
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

# # TODO: replace with one declaration
# resource "aws_route" "base_uat01_pcx_private_nat_0" {
#   count                     = "${length(var.uat01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.0.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.uat01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.uat01_peers.*.id, count.index)}"
# }

# resource "aws_route" "base_uat01_ctrl_pcx_private_nat_1" {
#   count                     = "${length(var.uat01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.1.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.uat01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.uat01_peers.*.id, count.index)}"
# }

# resource "aws_route" "base_uat01_ctrl_pcx_private_nat_2" {
#   count                     = "${length(var.uat01_peers)}"
#   route_table_id            = "${aws_route_table.private_nat.2.id}"
#   destination_cidr_block    = "${element(data.aws_vpc_peering_connection.uat01_peers.*.cidr_block, count.index)}"
#   vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.uat01_peers.*.id, count.index)}"
# }
