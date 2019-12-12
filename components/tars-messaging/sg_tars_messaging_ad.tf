# SG for the messaging server
resource "aws_security_group" "tars-messaging-ad" {
  name        = "${local.csi}-tars-msg-ad"
  description = "TARS Messaging AD"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-msg-ad"
    },
  )
}

