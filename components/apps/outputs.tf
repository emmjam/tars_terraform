# Output all the things needed by the other components
output "obs-sg-id" {
  value = module.obs.security_group_id
}

output "obs-tg-8080-arn" {
  value = aws_alb_target_group.private-obs2-8080.arn
}
