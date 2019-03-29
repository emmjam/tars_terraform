resource "aws_dx_private_virtual_interface" "primary" {
  count             = "${length(var.dc_gateway_name) == 0 ? 0 : 1}"
  connection_id     = "${var.dc_primary_connection_id}"
  dx_gateway_id     = "${aws_dx_gateway.dc-gateway.id}"
  name              = "${var.dc_vif_primary_name}"
  vlan              = "${var.dc_vif_primary_vlan}"
  address_family    = "ipv4"
  amazon_address    = "${var.dc_vif_primary_aws_router}"
  customer_address  = "${var.dc_vif_primary_router}"
  bgp_asn           = "${var.dc_vif_asn}"
  bgp_auth_key      = "${var.dc_vif_primary_bgp_auth_key}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-primary"
    )
  )}"

}

resource "aws_dx_private_virtual_interface" "secondary" {
  count             = "${length(var.dc_gateway_name) == 0 ? 0 : 1}"
  connection_id     = "${var.dc_secondary_connection_id}"
  dx_gateway_id     = "${aws_dx_gateway.dc-gateway.id}"
  name              = "${var.dc_vif_secondary_name}"
  vlan              = "${var.dc_vif_secondary_vlan}"
  address_family    = "ipv4"
  amazon_address    = "${var.dc_vif_secondary_aws_router}"
  customer_address  = "${var.dc_vif_secondary_router}"
  bgp_asn           = "${var.dc_vif_asn}"
  bgp_auth_key      = "${var.dc_vif_secondary_bgp_auth_key}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-secondary"
    )
  )}"
}