resource "aws_efs_file_system" "nexus" {
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-nexus"
    },
  )
}

