output "rds_endpoint" {
  value = "${aws_db_instance.sonarqube.endpoint}"
}

output "sq_subnet_ids" {
  value = "${module.microservice_sonarqube.subnet_ids}"
}

output "rds_subnet_ids" {
  value = "${module.rds_subents.subnet_ids}"
}

output "sq_security_group_id" {
  value = "${module.microservice_sonarqube.security_group_id}"
}

output "sq_asg_name" {
  value = "${module.microservice_sonarqube.autoscaling_group_name}"
}

output "autoscaling_group_name" {
  value = "${module.microservice_sonarqube.autoscaling_group_name}"
}