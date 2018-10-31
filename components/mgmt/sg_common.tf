# TODO: peacheym: Review to double check the appropriateness
#                 of using these multiple shared security groups.
resource "aws_security_group" "common" {
  name        = "${local.csi}-common"
  description = "Common SG for all microservices"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-common"
    )
  )}"
}
