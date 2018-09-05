# Output all the things needed by the other components
output "cpc-batch-sg-id" {
  value = "${aws_security_group.cpc_batch.id}"
}

