resource "aws_security_group" "main" {
  name        = local.csi_name
  description = "Main SG for ${upper(var.name)} Lambda function"

  vpc_id = var.vpc_id

  tags = merge(
    local.default_tags,
    tomap({
      "Name" = "${local.csi}/${var.name}",
    }),
  )
}
