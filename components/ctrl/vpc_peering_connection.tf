resource "aws_vpc_peering_connection" "mgmt" {
  vpc_id        = "${aws_vpc.ctrl.id}"
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

resource "aws_route" "private_nat_mgmt" {
  count                     = "${length(var.ctrl_nat_subnets_cidrs)}"
  route_table_id            = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block    = "${lookup(var.mgmt,"vpc_cidr_block")}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}
