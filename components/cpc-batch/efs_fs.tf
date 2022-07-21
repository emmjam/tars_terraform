resource "aws_efs_file_system" "cpc-batch-enc" {
  encrypted = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/cpc-batch-enc"
    },
  )
}