# tarsdb subnet group
# TODO: peacheym: rename to local.csi-tars-tarsdb - component must be included
#                 to guarantee no conflicts with other components.
#                 Also - align description to name
resource "aws_db_subnet_group" "tarsdb" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "tars",
    "tarsdb",
  )

  description = format("%s-%s-%s-%s", var.project, var.environment, "tars", "tars")

  subnet_ids = data.terraform_remote_state.base.outputs.subnets_tars_db
}

