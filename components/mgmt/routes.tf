resource "aws_route" "internet_public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.mgmt.id}"
}

resource "aws_route" "internet_private" {
  count                  = "${length(var.nat_subnets_cidrs)}"
  route_table_id         = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.mgmt.*.id,count.index)}"
}

# ctrl-pcx
resource "aws_route" "ctrl_pcx_private" {
  count                     = "${length(var.ctrl_peers)}"
  route_table_id            = "${aws_route_table.private.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers.*.id, count.index)}"
}

# TODO: replace with one declaration
resource "aws_route" "ctrl_pcx_private_nat_0" {
  count                     = "${length(var.ctrl_peers)}"
  route_table_id            = "${aws_route_table.private_nat.0.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers.*.id, count.index)}"
}

resource "aws_route" "ctrl_pcx_private_nat_1" {
  count                     = "${length(var.ctrl_peers)}"
  route_table_id            = "${aws_route_table.private_nat.1.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers.*.id, count.index)}"
}

resource "aws_route" "ctrl_pcx_private_nat_2" {
  count                     = "${length(var.ctrl_peers)}"
  route_table_id            = "${aws_route_table.private_nat.2.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.ctrl_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers.*.id, count.index)}"
}

# base-nonprod-pcx
resource "aws_route" "base-nonprod-pcx_private" {
  count                     = "${length(var.nonprod_peers)}"
  route_table_id            = "${aws_route_table.private.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.nonprod_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.nonprod_peers.*.id, count.index)}"
}

# TODO: replace with one declaration
resource "aws_route" "base_nonprod_pcx_private_nat_0" {
  count                     = "${length(var.nonprod_peers)}"
  route_table_id            = "${aws_route_table.private_nat.0.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.nonprod_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.nonprod_peers.*.id, count.index)}"
}

resource "aws_route" "base_nonprod_ctrl_pcx_private_nat_1" {
  count                     = "${length(var.nonprod_peers)}"
  route_table_id            = "${aws_route_table.private_nat.1.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.nonprod_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.nonprod_peers.*.id, count.index)}"
}

resource "aws_route" "base_nonprod_ctrl_pcx_private_nat_2" {
  count                     = "${length(var.nonprod_peers)}"
  route_table_id            = "${aws_route_table.private_nat.2.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.nonprod_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.nonprod_peers.*.id, count.index)}"
}

# base-opsdev-pcx
resource "aws_route" "base-opsdev-pcx_private" {
  count                     = "${length(var.opsdev_peers)}"
  route_table_id            = "${aws_route_table.private.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.id, count.index)}"
}

# TODO: replace with one declaration
resource "aws_route" "base_opsdev_pcx_private_nat_0" {
  count                     = "${length(var.opsdev_peers)}"
  route_table_id            = "${aws_route_table.private_nat.0.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.id, count.index)}"
}

resource "aws_route" "base_opsdev_ctrl_pcx_private_nat_1" {
  count                     = "${length(var.opsdev_peers)}"
  route_table_id            = "${aws_route_table.private_nat.1.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.id, count.index)}"
}

resource "aws_route" "base_opsdev_ctrl_pcx_private_nat_2" {
  count                     = "${length(var.opsdev_peers)}"
  route_table_id            = "${aws_route_table.private_nat.2.id}"
  destination_cidr_block    = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.cidr_block, count.index)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.opsdev_peers.*.id, count.index)}"
}
