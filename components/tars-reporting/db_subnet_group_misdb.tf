# tarsdb subnet group
resource "aws_db_subnet_group" "misdb" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "tars",
    "misdb"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "tars",
    "misdb"
  )}"

  subnet_ids = [
    "${data.terraform_remote_state.base.subnets_mis_db}",
  ]
}
