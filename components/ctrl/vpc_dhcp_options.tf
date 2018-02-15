resource "aws_vpc_dhcp_options" "ctrl" {
  domain_name         = "${var.component}.${var.environment}.${var.private_domain_name}"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "ctrl",
      ),
    )
  )}"
}

resource "aws_vpc_dhcp_options_association" "ctrl" {
  vpc_id          = "${aws_vpc.ctrl.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.ctrl.id}"
}
