# Output all the things needed by the other components
output "tars-mock-sg-id" {
  value = "${aws_security_group.tars-mock.id}"
}