resource "aws_vpc_dhcp_options" "tars" {
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
        "tars",
      ),
    )
  )}"
}

resource "aws_vpc_dhcp_options_association" "tars" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.tars.id}"
}
