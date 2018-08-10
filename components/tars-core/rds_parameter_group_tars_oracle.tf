################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "tarsdb" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "tarsdb"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "tarsdb"
  )}"

  family = "oracle-se2-12.1"
}
