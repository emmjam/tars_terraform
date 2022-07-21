resource "aws_efs_mount_target" "prometheus-enc" {
  count          = length(var.prometheus_efs_subnets_cidrs)
  file_system_id = aws_efs_file_system.prometheus-enc.id
  subnet_id      = element(module.subnets_prometheus_efs.subnet_ids, count.index)

  security_groups = [
    aws_security_group.prometheus-efs.id,
  ]
}