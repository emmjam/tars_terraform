resource "aws_security_group" "epdq_db" {
  name        = "${local.csi}/mock-epdq-db"
  description = "${local.csi}/mock-epdq-db"
  vpc_id      = var.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/mock-epdq-db"
    },
  )
}

