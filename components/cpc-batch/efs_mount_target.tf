resource "aws_efs_mount_target" "cpc-batch-enc" {
  count          = length(var.cpc_efs_subnets_cidrs)
  file_system_id = aws_efs_file_system.cpc-batch-efs-enc.id
  subnet_id      = element(module.subnets_cpc_batch_efs.subnet_ids, count.index)

  security_groups = [
    aws_security_group.cpc_batch_efs.id,
  ]
}