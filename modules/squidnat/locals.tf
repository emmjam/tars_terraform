locals {
  nodetype = "squidnat"

  module_instance = replace(
    format(
      "%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      local.nodetype,
    ),
    "_",
    "",
  )

  default_tags = merge(
    var.default_tags,
    {
      "Module"   = var.module
      "Nodetype" = local.nodetype
    },
  )

  squidnat_log = format(
    "/aws/ec2/%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "squidnat_0/cloud-init-output",
  )
}

