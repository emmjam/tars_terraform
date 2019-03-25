# Create the DC Gateway
resource "aws_dx_gateway" "dc-gateway" {
  name            = "${var.dc_gateway_name}"
  amazon_side_asn = "${var.dc_gateway_aws_asn}"
}
