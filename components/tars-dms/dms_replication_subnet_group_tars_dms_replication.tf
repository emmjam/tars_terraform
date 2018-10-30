# tars subnet group for DMS replication
resource "aws_dms_replication_subnet_group" "tars_dms_replication" {
  replication_subnet_group_id          = "${local.csi}-dms-replication"
  replication_subnet_group_description = "${local.csi}-dms-replication"

  subnet_ids = [
    "${module.subnets_rds.subnet_ids}",
  ]
}
