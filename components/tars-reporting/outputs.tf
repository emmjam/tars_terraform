output "mis-db-sg-id" {
  value = "${aws_security_group.tars-mis-db.id}"
}

output "rsis-db-sg-id" {
  value = "${aws_security_group.tars-rsis-db.id}"
}