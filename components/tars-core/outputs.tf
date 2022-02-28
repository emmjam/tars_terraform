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
  value = aws_security_group.apache_alb_public.id
}

output "tars-core-alb-target-group-irdt-frontend" {
  value = aws_alb_target_group.irdt-frontend-7443.arn
}

output "tars-apache-dns-name" {
  value = aws_alb.apache_public.dns_name
}

output "tars-apache-dns-zone-id" {
  value = aws_alb.apache_public.zone_id
}

