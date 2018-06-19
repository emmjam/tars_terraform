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
    "${data.terraform_remote_state.base.subnets_rds.subnet_ids}"
  ]
}