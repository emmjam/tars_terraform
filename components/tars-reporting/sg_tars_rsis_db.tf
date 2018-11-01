# SG for the TARS RSIS RDS DB
resource "aws_security_group" "tars-rsis-db" {
  name        = "${local.csi}-tars-rsis-db"
  description = "TARS RSIS DB"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-tars-rsis-db"
    )
  )}"
}
