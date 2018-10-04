resource "aws_security_group" "core" {
  name        = "${local.csi}/core"
  description = "${local.csi}/core"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/core"
    )
  )}"
}
