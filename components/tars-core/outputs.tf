# Output all the things needed by the other components
output "tars-core-frontend-sg-id" {
  value = module.tars_front.security_group_id
}

output "tars-core-backend-sg-id" {
  value = module.tars_back.security_group_id
}

output "tars-core-backend-alb-sg-id" {
  value = aws_security_group.tars-alb-backend.id
}

output "tars-core-db-sg-id" {
  value = aws_security_group.tars-core-db.id
}

output "tars-core-public-alb-sg-id" {
  value = aws_security_group.tars_core_alb_public.id
}

output "tars-core-alb-target-group-irdt-frontend" {
  value = aws_alb_target_group.irdt-frontend-7443.arn
}

output "tars-core-dns-name" {
  value = aws_alb.tars_core_public.dns_name
}

output "tars-core-dns-zone-id" {
  value = aws_alb.tars_core_public.zone_id
}

output "alb-tg-obs2-8080" {
  value = aws_alb_target_group.obs2-8080.arn
}

output "alb-tg-cpc2-9443" {
  value = aws_alb_target_group.cpc2-9443.arn
}

output "tars-core-sg-id" {
  value = aws_security_group.tars_core_alb_public.id
}