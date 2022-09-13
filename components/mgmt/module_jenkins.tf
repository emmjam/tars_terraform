module "jenkins" {
  source      = "../../modules/jenkins"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id = aws_vpc.mgmt.id

  availability_zones = data.aws_availability_zones.available.names

  hosted_zone_id = aws_route53_zone.mgmt.zone_id

  # TODO: peacheym: gitlab and jenkins have different domain name values?
  domain_name     = local.vpc_domain_name
  aws_account_ids = var.aws_account_ids

  private_route_table_ids = aws_route_table.private_nat.*.id

  lc_instance_type = var.jenkins_instance_type
  lc_ami_id        = data.aws_ami.jenkins.image_id

  lc_additional_sg_ids = [
    aws_security_group.common.id,
    aws_security_group.mgmt.id,
  ]

  elb_subnets_cidrs = var.jenkins_elb_subnets_cidrs
  nlb_subnets_cidrs = var.jenkins_nlb_subnets_cidrs

  ebs_volume_type = var.jenkins_ebs_volume_type
  ebs_volume_size = var.jenkins_ebs_volume_size

  jenkins_blue_nodes_number = var.jenkins_blue_nodes_number
  jenkins_blue_version      = var.jenkins_blue_version

  jenkins_blue_subnet_cidrs = var.jenkins_blue_subnets_cidrs

  jenkins_target_group = [
    aws_alb_target_group.jenkins.arn,
  ]

  default_tags = local.default_tags
}

