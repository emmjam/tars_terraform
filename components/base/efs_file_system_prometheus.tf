resource "aws_efs_file_system" "prometheus" {
  provisioned_throughput_in_mibps = var.prometheus_efs_provisioned_mibps
  throughput_mode                 = "provisioned"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/prometheus"
    },
  )
}

resource "aws_efs_file_system" "prometheus-enc" {
  provisioned_throughput_in_mibps = var.prometheus_efs_provisioned_mibps
  throughput_mode                 = "provisioned"
  encrypted                       = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/prometheus-enc"
    },
  )
}