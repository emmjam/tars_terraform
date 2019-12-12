resource "aws_efs_mount_target" "nexus" {
  count          = length(var.nexus_efs_subnets_cidrs)
  file_system_id = aws_efs_file_system.nexus.id
  subnet_id      = element(module.subnets_nexus_efs.subnet_ids, count.index)

  security_groups = [
    aws_security_group.nexus_efs.id,
  ]
}

