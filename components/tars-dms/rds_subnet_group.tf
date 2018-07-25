# tarsdb subnet group
resource "aws_db_subnet_group" "tarsdb_dms" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "tars",
    "tarsdb_dms"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "tars",
    "tarsdb_dms"
  )}"

  subnet_ids = [
    "${module.subnets_rds.subnet_ids}"
  ]
}
