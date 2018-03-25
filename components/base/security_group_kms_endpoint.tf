# Create an SG for the KMS endpoint
resource "aws_security_group" "kms_endpoint" {
  name        = "${var.project}-${var.environment}-${var.component}-kms-endpoint"
  description = "KMS Endpoint"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "kms-endpoint"
      ),
    )
  )}"
}