################################################################################
#
# Squid NAT Security Group
#
################################################################################

resource "aws_security_group" "squidnat" {
  name = format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    var.module,
  )

  description = format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    var.module,
  )

  vpc_id = var.vpc_id

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.module,
      )
      "Module" = var.module
    },
  )
}

