resource "aws_efs_mount_target" "tars-batch-enc" {
  count          = length(var.batch_efs_subnets_cidrs)
  file_system_id = aws_efs_file_system.tars-batch-enc.id
  subnet_id      = element(module.subnets_batch_efs.subnet_ids, count.index)

  security_groups = [
    aws_security_group.batch_efs.id,
  ]
}