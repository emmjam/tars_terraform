resource "aws_security_group" "jmeter" {
  name        = "${local.csi}/jmeter"
  description = "${local.csi}/jmeter"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/jmeter"
    )
  )}"
}
