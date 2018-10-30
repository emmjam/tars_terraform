# SG for the TARS RDS DB
resource "aws_security_group" "tars-dms" {
  name        = "${local.csi}/dms-dg"
  description = "TARS DMS"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/dms-dg"
    )
  )}"
}
