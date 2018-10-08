# Output all the things needed by the other components
output "cpc-batch-sg-id" {
  value = "${aws_security_group.cpc_batch.id}"
}

output "cpc-batch_efs_id" {
  value = "${aws_efs_file_system.cpc-batch-efs.id}"
}
