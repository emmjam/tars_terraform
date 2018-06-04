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
  peer_owner_id = "${var.mgmt_aws_account_id}"
  peer_vpc_id   = "${var.mgmt_vpc_id}"

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

# Peer with the DVSA AD account
resource "aws_vpc_peering_connection" "dvsa_ad" {
  count = "${var.ad_peering_enabled}"
  vpc_id        = "${aws_vpc.vpc.id}"
  peer_owner_id = "${var.ad_account}"
  peer_vpc_id   = "${var.ad_peering_vpc}"

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
        "dvsa_ad"
      ),
      "Side", "Requester"
    )
  )}"
}
