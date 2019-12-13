# Output all the things needed by the other components
output "tars-batch-sg-id" {
  value = module.tars_batch.security_group_id
}

output "batch_efs_id" {
  value = aws_efs_file_system.batch.id
}

