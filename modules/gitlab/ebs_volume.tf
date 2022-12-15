resource "aws_ebs_volume" "gitlab" {
  availability_zone = element(var.availability_zones, 0)

  type = var.ebs_volume_type
  size = var.ebs_volume_size

  encrypted = "true"

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.name,
      )
      "Module" = var.module
    },
  )
}

