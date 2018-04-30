resource "aws_vpc_peering_connection" "mgmt" {
  vpc_id        = "${aws_vpc.ctrl.id}"
  peer_owner_id = "${var.mgmt_aws_account_id}"
  peer_vpc_id   = "${data.terraform_remote_state.mgmt.vpc_id}"

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
  route_table_id            = "${aws_route_table.private_nat.id}"
  destination_cidr_block    = "${data.terraform_remote_state.mgmt.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

resource "aws_route" "private_nat_ctrl" {
  route_table_id            = "${aws_route_table.private.id}"
  destination_cidr_block    = "${data.terraform_remote_state.mgmt.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}
