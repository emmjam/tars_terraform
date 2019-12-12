resource "aws_ebs_volume" "sonarqube" {
  availability_zone = element(var.aws_availability_zones, 0)

  type = var.ebs_volume_type
  size = var.ebs_volume_size

  encrypted = "false"

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "sonarqube",
      )
      "Module" = var.module
    },
  )
}

