# Output all the things needed by the other components
output "tars-core-frontend-sg-id" {
  value = "${aws_security_group.tars-core-frontend.id}"
}

output "tars-core-backend-sg-id" {
  value = "${aws_security_group.tars-core-backend.id}"
}

output "tars-core-backend-alb-sg-id" {
  value = "${aws_security_group.tars-alb-backend.id}"
}

output "tars-core-db-sg-id" {
  value = "${aws_security_group.tars-core-db.id}"
}

output "tars-core-alb-target-group-irdt-frontend" {
  value = "${aws_alb_target_group.irdt-frontend-7443.arn}"
}
