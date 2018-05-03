# Create the VPG for the Transit VPC
resource "aws_vpn_gateway" "vpn_gw" {
    count = "${var.transit_peering_enabled}"
    vpc_id = "${aws_vpc.vpc.id}"

    tags = "${merge(
        var.default_tags,
        map(
        "Name", format(
            "%s-%s-%s/%s",
            var.project,
            var.environment,
            var.component,
            "transit_vpg"
        ),
        "transitvpc:spoke", "true"
        )
    )}"
}

# Enable route propagation
resource "aws_vpn_gateway_route_propagation" "private_nonat_to_transit_vpc" {
    count = "${var.transit_peering_enabled}"
    vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
    route_table_id = "${aws_route_table.private_nonat.id}"
}


# Enable route propagation
resource "aws_vpn_gateway_route_propagation" "private_nat_to_transit_vpc" {
    count = "${var.transit_peering_enabled? length(var.squidnat_subnets_cidrs) : 0}"
    vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
    route_table_id = "${element(aws_route_table.private_nat.*.id, count.index)}"
}
