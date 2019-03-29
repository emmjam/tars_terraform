# Create the DC Gateway
resource "aws_dx_gateway" "dc-gateway" {
  count           = "${length(var.dc_gateway_name) == 0 ? 0 : 1}"
  name            = "${var.dc_gateway_name}"
  amazon_side_asn = "${var.dc_gateway_aws_asn}"
}
