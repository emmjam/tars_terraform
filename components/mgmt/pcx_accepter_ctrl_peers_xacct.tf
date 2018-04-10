resource "aws_vpc_peering_connection_accepter" "ctrl_peers_xacct" {
  count                     = "${length(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id)}"
  vpc_peering_connection_id = "${element(data.aws_vpc_peering_connection.ctrl_peers_xacct.*.id, count.index)}"
  auto_accept               = "true"

  # This needs reviewing. Terraform documentation on how this should be approached is very poor
  # This appears to modify requester-side permissions which it has no rights to do
  # accepter {
  #   "allow_remote_vpc_dns_resolution" = "true"
  # }

  # Accepter is grammatically incorrect, but is the
  # form terraform uses and so we standardise on it
  tags = "${merge(
    "${var.default_tags}",
    map(
      "Name", format(
        "%s-%s-%s/%s/%s",
        var.project,
        var.environment,
        var.component,
        "ctrl_peers_xacct",
        element(
          data.aws_vpc_peering_connection.ctrl_peers_xacct.*.owner_id,
          count.index
        )
      ),
      "Component", var.component,
      "Side", "Accepter"
    )
  )}"
}
