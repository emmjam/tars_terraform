resource "aws_efs_file_system" "batch" {
  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/batch"
    )
  )}"
}
