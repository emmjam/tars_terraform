# SG for the TARS RDS DB
resource "aws_security_group" "tars-core-db" {
  name        = "${local.csi}-tars-core-db"
  description = "TARS Core DB"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars-core-db"
    )
  )}"
}
