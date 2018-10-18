resource "aws_security_group" "sftpplus_efs" {
  name        = "${local.csi}-sftpplus-efs"
  description = "${local.csi}-sftpplus-efs"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-sftpplus-efs"
    )
  )}"
}
