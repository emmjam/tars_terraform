# TARS VPC DHCP options
resource "aws_vpc_dhcp_options" "tars" {
  domain_name         = "${var.environment}.${var.private_domain_name}"
  count = "${length(var.domain_name_servers) == 0 ? 0 : 1}"
  domain_name_servers = ["${var.domain_name_servers}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars",
      ),
    )
  )}"
}

resource "aws_vpc_dhcp_options_association" "tars" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.tars.id}"
}
