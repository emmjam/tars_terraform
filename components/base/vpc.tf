resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s",
        var.project,
        var.environment,
        var.component
      ),
    )
  )}"
}