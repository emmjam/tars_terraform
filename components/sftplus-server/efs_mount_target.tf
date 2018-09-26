resource "aws_efs_mount_target" "sftpplus" {
  count          = "${length(var.sftpplus_efs_subnets_cidrs)}"
  file_system_id = "${aws_efs_file_system.sftpplus.id}"
  subnet_id      = "${element(module.subnets_sftpplus_efs.subnet_ids, count.index)}"

  security_groups = [
    "${aws_security_group.sftpplus_efs.id}",
  ]
}
