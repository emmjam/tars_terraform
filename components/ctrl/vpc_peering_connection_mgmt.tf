resource "aws_vpc_peering_connection" "mgmt" {
  vpc_id        = aws_vpc.ctrl.id
  peer_owner_id = var.mgmt_aws_account_id
  peer_vpc_id   = data.terraform_remote_state.mgmt.outputs.vpc_id

  auto_accept = false

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/mgmt"
      "Side" = "Requester"
    },
  )
}

