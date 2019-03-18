resource "aws_security_group" "ldap_elb" {
  name        = "${local.csi}-ldap-elb"
  description = "Security group for LDAP ELB"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-ldap-elb"
    )
  )}"
}
