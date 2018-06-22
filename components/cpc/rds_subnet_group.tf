# tarsdb subnet group
resource "aws_db_subnet_group" "cpcdb" {
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

  subnet_ids = [
    "${data.terraform_remote_state.base.subnets_tars_db}"
  ]
}
