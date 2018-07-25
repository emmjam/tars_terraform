resource "aws_route" "internet_public" {
  route_table_id         = "${aws_route_table.test_rds.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${data.terraform_remote_state.base.igw}"
}

# Enable route propagation
resource "aws_vpn_gateway_route_propagation" "test_rds_to_transit_vpc" {
    count = "${var.transit_peering_enabled}"
    vpn_gateway_id = "${data.terraform_remote_state.base.transit_vpn_gw}"
    route_table_id = "${aws_route_table.test_rds.id}"
}