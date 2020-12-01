resource "aws_ebs_volume" "jenkins" {
  availability_zone = element(var.availability_zones, 0)

  type = var.ebs_volume_type

  snapshot_id       = var.ebs_snapshot_id
  encrypted = "false"

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

