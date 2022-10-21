locals {
  asg_default_tags = merge(
    var.asg_default_tags,
      {
        Name       = format(
          "%s-%s-%s/%s",
          var.project,
          var.environment,
          var.component,
          var.name,
        )
        Nodetype              = var.name
        Component             = var.component
        Module                = var.module
      },
  )
}