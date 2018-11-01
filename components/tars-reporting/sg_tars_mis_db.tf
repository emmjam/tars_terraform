# SG for the TARS MIS RDS DB
resource "aws_security_group" "tars-mis-db" {
  name        = "${local.csi}-tars-mis-db"
  description = "TARS MIS DB"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-tars-mis-db"
    )
  )}"
}
