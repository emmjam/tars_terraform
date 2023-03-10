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

  epdq_name        = "epdq"
  gov_gateway_name = "gov_gateway"
}

