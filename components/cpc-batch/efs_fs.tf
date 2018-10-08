resource "aws_efs_file_system" "cpc-batch-efs" {
  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/cpc-batch-efs"
    )
  )}"
}
