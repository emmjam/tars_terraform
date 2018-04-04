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
        "transitvpc:spoke" = "true"
        )
    )}"
}

# Enable route propagation
resource "aws_vpn_gateway_route_propagation" "backend_to_transit_vpc" {
    count = "${var.transit_peering_enabled}"
    vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
    route_table_id = "${aws_route_table.backend.id}"
}
