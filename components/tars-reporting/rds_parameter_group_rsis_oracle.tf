################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "rsisdb" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "rsisdb"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "rsisdb"
  )}"

  family = "oracle-se2-12.1"
}
