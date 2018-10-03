resource "aws_efs_file_system" "prometheus" {
  provisioned_throughput_in_mibps = "${var.prometheus_efs_provisioned_mibps}"
  throughput_mode                 = "provisioned"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/prometheus"
    )
  )}"
}
