resource "aws_security_group" "oraclexe" {
  count       = var.account_environment != "mgmt" ? 1 : 0
  name        = "${local.csi}-oraclexe"
  description = "OracleXE"
  vpc_id      = aws_vpc.ctrl.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/oraclexe"
    },
  )
}

