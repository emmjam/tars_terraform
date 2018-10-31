resource "aws_vpc" "mgmt" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", local.csi
    )
  )}"
}
