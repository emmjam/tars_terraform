# Peer with the MGMT account in mgmt
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

# Routes to the MGMT Account
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

# Peer with the CTRL account in mgmt
resource "aws_vpc_peering_connection" "ctrl_mgmt" {
  vpc_id        = "${aws_vpc.vpc.id}"
  peer_owner_id = "${lookup(var.ctrl_mgmt,"aws_account_id")}"
  peer_vpc_id   = "${lookup(var.ctrl_mgmt,"vpc_id")}"

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
        "ctrl-mgmt"
      ),
      "Side", "Requester"
    )
  )}"
}

# Routes to the CTRL MGMT Account
resource "aws_route" "private_ctrl_mgmt" {
  route_table_id            = "${aws_route_table.backend.id}"
  destination_cidr_block    = "${lookup(var.ctrl_mgmt,"vpc_cidr_block")}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

resource "aws_route" "jenkins_ctrl_mgmt" {
  route_table_id            = "${aws_route_table.jenkins_nat.id}"
  destination_cidr_block    = "${lookup(var.ctrl_mgmt,"vpc_cidr_block")}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

# Peer with the CTRL account in nonprod
resource "aws_vpc_peering_connection" "ctrl_nonprod" {
  vpc_id        = "${aws_vpc.vpc.id}"
  peer_owner_id = "${lookup(var.ctrl_nonprod,"aws_account_id")}"
  peer_vpc_id   = "${lookup(var.ctrl_nonprod,"vpc_id")}"

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
        "ctrl-nonprod"
      ),
      "Side", "Requester"
    )
  )}"
}

# Routes to the Nonprod MGMT Account
resource "aws_route" "private_ctrl_nonprod" {
  route_table_id            = "${aws_route_table.backend.id}"
  destination_cidr_block    = "${lookup(var.ctrl_nonprod,"vpc_cidr_block")}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}

resource "aws_route" "jenkins_ctrl_nonprod" {
  route_table_id            = "${aws_route_table.jenkins_nat.id}"
  destination_cidr_block    = "${lookup(var.ctrl_nonprod,"vpc_cidr_block")}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt.id}"
}
