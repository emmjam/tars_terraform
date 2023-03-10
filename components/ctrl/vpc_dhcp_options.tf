resource "aws_vpc_dhcp_options" "ctrl" {
  domain_name = local.vpc_domain_name

  domain_name_servers = [
    "AmazonProvidedDNS",
  ]

  tags = merge(
    local.default_tags,
    {
      "Name" = local.csi
    },
  )
}

resource "aws_vpc_dhcp_options_association" "ctrl" {
  vpc_id          = aws_vpc.ctrl.id
  dhcp_options_id = aws_vpc_dhcp_options.ctrl.id
}

