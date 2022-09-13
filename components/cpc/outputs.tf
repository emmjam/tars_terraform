# Output all the things needed by the other components
output "cpc-back-alb" {
  value = aws_security_group.cpc-back-alb.id
}

output "subnet_cidrs_cpc_backend" {
  value = module.cpc-back.subnet_ids
}

output "cpc-db-sg-id" {
  value = aws_security_group.cpc-db.id
}

output "cpc-back-sg-id" {
  value = module.cpc-back.security_group_id
}

output "cpc-front-sg-id" {
  value = module.cpc-front.security_group_id
}

output "cpc_dvsa_internet_sg_id" {
  value = aws_security_group.cpc-front-dvsa-internet-alb.id
}

output "cpc_dvsa_internet_alb_zone_id" {
  value = aws_alb.cpc-front-dvsa-internet.zone_id
}

output "cpc_dvsa_internet_alb_dns_name" {
  value = aws_alb.cpc-front-dvsa-internet.dns_name
}

output "cpc_dvsa_internet_listener_arn" {
  value = aws_alb_listener.cpc-front-dvsa-internet-8443.arn
}