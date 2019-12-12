# Output all the things needed by the other components
output "cpc-batch-sg-id" {
  value = module.cpc_batch.security_group_id
}

output "cpc-batch_efs_id" {
  value = aws_efs_file_system.cpc-batch-efs.id
}

