# Output all the things needed by the other components
output "tars-batch-sg-id" {
  value = "${aws_security_group.tars-batch.id}"
}