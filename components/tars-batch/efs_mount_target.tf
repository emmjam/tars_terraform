resource "aws_efs_mount_target" "tars-batch-enc" {
<<<<<<< HEAD
  count          = length(var.batch_efs_subnets_cidrs)
=======
  #count          = length(var.batch_efs_subnets_cidrs)
  count          = 3
>>>>>>> 6ffb161b56869323a4c00013a47ea019e93ecff1
  file_system_id = aws_efs_file_system.tars-batch-enc.id
  subnet_id      = element(module.subnets_batch_efs.subnet_ids, count.index)

  security_groups = [
    aws_security_group.batch_efs.id,
  ]
}