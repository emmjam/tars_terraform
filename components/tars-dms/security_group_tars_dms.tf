# SG for the TARS RDS DB
resource "aws_security_group" "tars-dms" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "dms-dg"
  )}"
  
  description = "TARS DMS"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "dms-sg"
      ),
    )
  )}"
}
