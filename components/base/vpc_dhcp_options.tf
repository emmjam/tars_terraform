# TARS VPC DHCP options
resource "aws_vpc_dhcp_options" "tars" {
  count       = "${length(var.domain_name_servers) == 0 ? 0 : 1}"
  domain_name = "${local.vpc_domain_name}"

  domain_name_servers = [
    "${var.domain_name_servers}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars"
    )
  )}"
}

resource "aws_vpc_dhcp_options_association" "tars" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.tars.id}"
}
