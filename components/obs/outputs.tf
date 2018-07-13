# Output all the things needed by the other components
output "obs-sg-id" {
  value = "${aws_security_group.obs.id}"
}