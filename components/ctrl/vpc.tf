resource "aws_vpc" "ctrl" {
  cidr_block           = "${var.ctrl_vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "ctrl"
      ),
    )
  )}"
}
