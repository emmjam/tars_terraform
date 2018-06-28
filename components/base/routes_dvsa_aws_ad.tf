resource "aws_route" "dsva_ad" {
  count = "${var.ad_peering_enabled? length(var.squidnat_subnets_cidrs) : 0}"
  route_table_id         = "${element(aws_route_table.private_nat.*.id, count.index)}"
  destination_cidr_block = "${var.dvsa_aws_ad_subnet_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.dvsa_ad.id}"
}
