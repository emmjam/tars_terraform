resource "aws_route" "internet_public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.tars.id}"
}

resource "aws_route" "private_nats_default" {
  count                  = "${length(var.squidnat_subnets_cidrs)}"
  route_table_id         = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = "${element(module.squidnat.instance_ids,count.index)}"
}

resource "aws_route" "internet_natgw" {
  route_table_id         = "${aws_route_table.private_natgw.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.tars.id}"
}
