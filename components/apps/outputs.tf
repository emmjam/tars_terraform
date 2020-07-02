# Output all the things needed by the other components
output "obs-sg-id" {
  value = module.obs.security_group_id
}

output "obs-alb-target-group-obs" {
  value = aws_alb_target_group.obs-8080.arn
}

output "ibs_aurora_sg_id" {
  value = aws_security_group.ibs_aurora.id
}

output "ibs-alb-target-group-ibs-apache" {
  value = aws_alb_target_group.ibs-80[0].arn
}

output "fyndi_back_alb_sg_id" {
  value = aws_security_group.fyndi-b-alb.id
}

output "ibs_back_alb_sg_id" {
  value = aws_security_group.ibs-alb.id
}
