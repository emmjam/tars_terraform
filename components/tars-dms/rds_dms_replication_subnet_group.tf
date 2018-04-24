# tars subnet group for DMS replication
resource "aws_dms_replication_subnet_group" "tars_dms_replication" {
  replication_subnet_group_description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "dms-replication"
  )}"

  replication_subnet_group_id = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "dms-replication"
  )}"

  subnet_ids = [
    "${data.terraform_remote_state.base.subnets_tars_db}"
  ]
}