resource "aws_efs_file_system" "nexus-enc" {
  encrypted = true
  
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-nexus-enc"
    },
  )
}