# Security group that the OpenAM nodes will be attached to
resource "aws_security_group" "jenkinsnode" {
  name        = "${local.csi}/jenkinsnode"
  description = "${local.csi}/jenkinsnode"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/jenkinsnode"
    )
  )}"
}
