resource "aws_vpc_peering_connection" "mgmt" {
  vpc_id        = "${aws_vpc.vpc.id}"
  peer_owner_id = "${lookup(var.mgmt,"aws_account_id")}"
  peer_vpc_id   = "${lookup(var.mgmt,"vpc_id")}"

  auto_accept = false

  requester {
    "allow_remote_vpc_dns_resolution" = true
  }

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "mgmt"
      ),
      "Side", "Requester"
    )
  )}"
}


resource "aws_route" "private_mgmt" {
  route_table_id            = "${aws_route_table.backend.id}"
  destination_cidr_block    = "${lookup(var.mgmt,"vpc_cidr_block")}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

resource "aws_route" "jenkins_mgmt" {
  route_table_id            = "${aws_route_table.jenkins_nat.id}"
  destination_cidr_block    = "${lookup(var.mgmt,"vpc_cidr_block")}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

# resource "aws_route" "jenkins_nat" {
#   count                     = "${length(var.jenkins_nat_subnets_cidrs)}"
#   route_table_id            = "${element(aws_route_table.jenkins_nat.*.id,count.index)}"
#   destination_cidr_block    = "${lookup(var.mgmt,"vpc_cidr_block")}"
#   vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
# }

# resource "aws_route_table_association" "private" {
#   count                     = "${length(var.backend_subnets_cidrs)}"
#   subnet_id                 = "${element(module.tars_backend_subnets.subnet_ids, count.index)}"
#   route_table_id            = "${aws_route_table.jenkins_nat.id}"
# }