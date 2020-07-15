locals {
  # GENERAL
  csi = format(
    "%s-%s-%s",
    var.project,
    var.environment,
    var.component,
  )

  csi_name = format(
    "%s-%s",
    local.csi,
    var.name,
  )

  parent_module = lookup(
    var.default_tags,
    "Module",
    "",
  )

  default_tags = merge(
    var.default_tags,
    map(
      "Module", local.parent_module == "" ? var.module : format(
        "%s/%s",
        local.parent_module,
        var.module,
      ),
    ),
  )
}
