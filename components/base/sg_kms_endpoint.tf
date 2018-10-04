# TODO: peacheym: Replace with module_vpceif
# Create an SG for the KMS endpoint
resource "aws_security_group" "kms_endpoint" {
  name        = "${local.csi}-kms-endpoint"
  description = "KMS Endpoint"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/kms-endpoint"
    )
  )}"
}
