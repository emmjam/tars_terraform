resource "aws_route" "private_nats_default" {
  count                  = "${length(var.nat_subnets_cidr)}"
  route_table_id         = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.mgmt.*.id, count.index)}"
}