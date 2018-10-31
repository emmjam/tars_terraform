# Output all the things needed by the other components
output "obs-sg-id" {
  value = "${aws_security_group.obs.id}"
}

output "obs-alb-target-group-obs" {
  value = "${aws_alb_target_group.obs-8080.arn}"
}