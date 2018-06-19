# ibsdb subnet group
resource "aws_db_subnet_group" "ibsdb" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "ibs",
    "ibsdb"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "ibs",
    "ibs"
  )}"

  subnet_ids = [
    "${var.ibs_db_subnets_cidrs}"
  ]
}