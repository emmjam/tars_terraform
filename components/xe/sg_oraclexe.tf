# SG for the TARS RDS DB
resource "aws_security_group" "oraclexe" {
  name        = "${local.csi}-oraclexe"
  description = "OracleXE"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/oraclexe"
    )
  )}"
}
