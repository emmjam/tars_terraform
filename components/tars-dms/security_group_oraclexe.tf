# SG for the TARS RDS DB
resource "aws_security_group" "oraclexe" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "oraclexe"
  )}"
  
  description = "OracleXE"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "oraclexe"
      ),
    )
  )}"
}
