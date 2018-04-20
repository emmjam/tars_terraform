# Peer with the CTRL vpc
resource "aws_vpc_peering_connection" "ctrl" {
  vpc_id        = "${aws_vpc.vpc.id}"
  peer_owner_id = "${var.aws_account_id}"                      # Always the same account.
  peer_vpc_id   = "${data.terraform_remote_state.ctrl.vpc_id}"

  auto_accept = "true" # Always true. Ctrl is always in the same account.

  requester {
    "allow_remote_vpc_dns_resolution" = "true"
  }

  # Requester is grammatically incorrect, but is the
  # form terraform uses and so we standardise on it
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "ctrl"
      ),
      "Component", var.component
    )
  )}"
}

# Peer with the MGMT account
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

resource "aws_route" "jenkins_mgmt" {
  count                     = "${length(var.squidnat_subnets_cidrs)}"
  route_table_id            = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block    = "${lookup(var.mgmt,"vpc_cidr_block")}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

resource "aws_route" "jenkins_ctrl" {
  count                     = "${length(var.squidnat_subnets_cidrs)}"
  route_table_id            = "${element(aws_route_table.private_nat.*.id,count.index)}"
  destination_cidr_block    = "${data.terraform_remote_state.ctrl.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}

resource "aws_route" "private_nat_ctrl" {
  route_table_id            = "${data.terraform_remote_state.ctrl.rt_private_nat_id}"
  destination_cidr_block    = "${aws_vpc.vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}

resource "aws_route" "private_ctrl_bastion" {
  route_table_id            = "${data.terraform_remote_state.ctrl.rt_private_id}"
  destination_cidr_block    = "${aws_vpc.vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
}
