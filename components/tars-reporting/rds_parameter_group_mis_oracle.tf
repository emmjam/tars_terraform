################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "misdb" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "misdb"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "misdb"
  )}"

  family = "oracle-se2-12.1"
}
