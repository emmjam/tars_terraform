locals {
  # GENERAL
  csi = format(
    "%s-%s-%s",
    var.project,
    var.environment,
    var.component,
  )

  csi_global = format(
    "%s-%s-%s-%s",
    var.project,
    data.aws_caller_identity.current.account_id,
    var.environment,
    var.component,
  )

  parent_module = lookup(
    var.default_tags,
    "Module",
    "",
  )

  default_tags = merge(
    var.default_tags,
    tomap({
      "Module" = local.parent_module == "" ? var.module : format(
        "%s/%s",
        local.parent_module,
        var.module,
      ),
    }),
  )

  # SPECIFIC
  # ...
}
