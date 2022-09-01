resource "aws_efs_file_system" "sftpplus" {
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/efs"
    },
  )
}

resource "aws_efs_file_system" "sftpplus-enc" {
  encrypted = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/sftpplus-enc"
    },
  )
}