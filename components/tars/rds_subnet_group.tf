# tarsdb subnet group
resource "aws_db_subnet_group" "tarsdb" {
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
    "tars"
  )}"

  subnet_ids = [
    "${data.terraform_remote_state.base.subnets_tars_db}"
  ]
}
