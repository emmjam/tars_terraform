resource "aws_vpc_dhcp_options" "mgmt" {
  domain_name         = "${var.environment}.${var.private_domain_name}"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "mgmt",
      ),
    )
  )}"
}

resource "aws_vpc_dhcp_options_association" "mgmt" {
  vpc_id          = "${aws_vpc.mgmt.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.mgmt.id}"
}
