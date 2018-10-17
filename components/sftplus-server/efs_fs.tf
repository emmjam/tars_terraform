resource "aws_efs_file_system" "sftpplus" {
  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/efs"
    )
  )}"
}
