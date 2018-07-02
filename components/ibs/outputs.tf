# Output all the things needed by the other components
output "ibs_aurora_sg_id" {
  value = "${aws_security_group.ibs_aurora.id}"
}
