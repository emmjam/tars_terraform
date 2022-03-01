resource "aws_alb" "reporting_xe_alb" {
  count = var.reporting_xe_count

  name = format("%s-%s", local.csi, "reporting-xe")

  access_logs {
    enabled = true
    bucket  = module.access_logs_bucket[count.index].id
    prefix  = "front"
  }

  subnets = module.alb_public_subnets.subnet_ids

  security_groups = [
    aws_security_group.reporting_xe_alb[count.index].id
  ]

  tags = merge(
    local.default_tags,
    { "Name" = "${local.csi}-reporting-xe" },
  )
}
