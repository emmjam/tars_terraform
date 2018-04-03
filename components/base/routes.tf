# Add the routes for the internet
resource "aws_route" "internet_public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.tars.id}"
}

# Add the routes for the private subnets to the internet
resource "aws_route" "internet_private" {
  count                  = "${length(var.jenkins_nat_subnets_cidrs)}"
  route_table_id         = "${element(aws_route_table.jenkins_nat.*.id,count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.tars.*.id,count.index)}"
}

# Add the route to the Selenium CIDR
# Only add if we specified a peering id in the TF environment
resource "aws_route" "jenkinsnode_to_selenium" {
  count                     = "${length(var.gridlastic_peering_id)}"
  route_table_id            = "${aws_route_table.jenkins_nat.id}"
  destination_cidr_block    = "${var.gridlastic_cidr}"
  vpc_peering_connection_id = "${var.gridlastic_peering_id[0]}"
}