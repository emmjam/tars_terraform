resource "aws_efs_file_system" "batch" {
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/batch"
    },
  )
}

resource "aws_efs_file_system" "tars-batch-enc" {
  encrypted = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-batch-enc"
    },
  )
}