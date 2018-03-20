output "tars-core-frontend-sg-id" {
  value = "${aws_security_group.tars-core-frontend.id}"
}


output "tars-core-db-sg-id" {
  value = "${aws_security_group.tars-core-db.id}"
}