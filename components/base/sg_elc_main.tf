resource "aws_security_group" "elc_main" {
  name        = "${local.csi}/elc_main"
  description = "${local.csi}/elc_main"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/elc_main"
    )
  )}"
}
