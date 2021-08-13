# Output all the things needed by the other components
output "tars_core_iam_instance_profile_name" {
  value = aws_iam_instance_profile.tars-core.name
}

output "tars_messaging_iam_instance_profile_name" {
  value = aws_iam_instance_profile.tars-messaging.name
}

output "subnets_alb_public" {
  value = module.alb_public_subnets.subnet_ids
}

output "subnets_tars_dvsa_public" {
  value = module.tars_dvsa_alb_subnets.subnet_ids
}

output "subnets_cpc_alb_internal" {
  value = module.cpc_alb_internal.subnet_ids
}

output "subnets_tars_alb_internal" {
  value = module.tars_alb_internal.subnet_ids
}

output "subnets_obs_alb_internal" {
  value = module.obs_alb_internal.subnet_ids
}

output "subnets_tars_backend" {
  value = module.tars_backend_subnets.subnet_ids
}

output "subnets_tars_backend_elb" {
  value = module.tars_backend_elb_subnets.subnet_ids
}

output "subnets_tars_backend_api_alb" {
  value = module.tars_backend_api_alb_subnets.subnet_ids
}

output "subnet_cidrs_tars_backend" {
  value = var.tars_backend_subnets_cidrs
}

output "subnets_tars_web" {
  value = module.tars_web_subnets.subnet_ids
}

output "subnets_tars_messaging" {
  value = module.tars_messaging_subnets.subnet_ids
}

output "subnets_tars_messaging_alb" {
  value = module.tars_messaging_subnets_alb.subnet_ids
}

output "route_table_jenkins_nat" {
  value = aws_route_table.private_nat.*.id
}

output "subnets_tars_db" {
  value = module.subnets_rds.subnet_ids
}

output "subnets_cpc_db" {
  value = module.subnets_cpc_rds.subnet_ids
}

output "subnets_fyndi_back_alb" {
  value = module.fyndi_back_alb_subnets.subnet_ids
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_zone_id" {
  value = aws_route53_zone.vpc_private.zone_id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_nat_route_table_id" {
  value = aws_route_table.private_nat.*.id
}

output "private_nonat_route_table_id" {
  value = aws_route_table.private_nonat.id
}

output "jenkins_net_route_table_id" {
  value = aws_route_table.private_nat.*.id
}

output "awsmq_sg_id" {
  value = aws_security_group.tars-awsmq.id
}

output "ctrl_peering_id" {
  value = aws_vpc_peering_connection.ctrl.id
}

output "kms_sg_id" {
  value = aws_security_group.kms_endpoint.id
}

output "elc_sg_id" {
  value = aws_security_group.elc_main.id
}

output "subnets_tars_awsmq" {
  value = module.tars_awsmq_subnets.subnet_ids
}

output "core_sg_id" {
  value = aws_security_group.core.id
}

output "jmeter_sg_id" {
  value = module.microservice_jmeter.security_group_id
}

output "iam_policy_cloudwatch_arn" {
  value = aws_iam_policy.cloudwatch.arn
}

output "iam_policy_bobjnode_arn" {
  value = aws_iam_policy.bobjnode.arn
}

output "subnets_ibs_db" {
  value = module.subnets_rds.subnet_ids
}

output "igw" {
  value = aws_internet_gateway.tars.id
}

output "subnets_mis_db" {
  value = module.subnets_mis.subnet_ids
}

output "prometheus_sg_id" {
  value = module.prometheus.security_group_id
}

output "nat_gw_ip" {
  value = aws_eip.nat.*.public_ip
}

output "sns_alerts_arn" {
  value = aws_sns_topic.alerts.arn
}

output "subnets_sftpplus_nlb" {
  value = module.sftpplus_nlb.subnet_ids
}

output "iam_role_db_reports_arn" {
  value = "${aws_iam_role.dbreports_output.arn}"
}

output "squidnat_sg_id" {
  value = module.squidnat.security_group_id
}

output "nameservers" {
  value = aws_route53_zone.public_domain.name_servers
}
 
