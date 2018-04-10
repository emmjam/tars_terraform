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

# Routes to the CTRL VPC
# resource "aws_route" backend_ctrl" {
#   route_table_id            = "${aws_route_table.backend.id}"
#   destination_cidr_block    = "${lookup(var.ctrl,"vpc_cidr_block")}"
#   vpc_peering_connection_id = "${aws_vpc_peering_connection.ctrl.id}"
# }
