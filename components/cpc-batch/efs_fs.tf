resource "aws_efs_file_system" "cpc-batch-efs-enc" {
  encrypted = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/cpc-batch-efs-enc"
    },
  )
