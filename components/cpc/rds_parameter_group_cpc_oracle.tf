################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "cpcdb" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpcdb"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpcdb"
  )}"

  family = "oracle-se2-12.1"
}
