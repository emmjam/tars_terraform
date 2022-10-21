locals {
  # Compound Scope Identifier
  csi = replace(
    format("%s-%s-%s", var.project, var.environment, var.component),
    "_",
    "",
  )

  default_tags = merge(
    var.default_tags,
    {
      "Module" = var.module
    },
  )

  asg_default_tags = merge (
    var.asg_default_tags,
    {
      Name = format("%s/%s", local.csi, var.name)
      Nodetype = var.name
      Module = var.module
    }
  )
}

