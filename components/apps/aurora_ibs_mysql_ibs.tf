# Create the IBS Aurora DB
resource "aws_rds_cluster" "ibsdb_cluster" {
  cluster_identifier           = "${var.project}-${var.environment}-ibs-ibsdb-cluster"
  database_name                = "ibsdb"
  master_username              = "${var.ibs_rds_username}"
  master_password              = "${var.ibs_rds_password}"
  backup_retention_period      = "${var.ibs_rds_backup_retention_period}"
  preferred_backup_window      = "${var.ibs_rds_backup_window}"
  preferred_maintenance_window = "${var.ibs_rds_maint_window}"
  db_subnet_group_name         = "${aws_db_subnet_group.ibsdb.name}"
  snapshot_identifier          = "${var.ibs_rds_snapshot}"
  final_snapshot_identifier    = "${local.csi}-ibsdb-final"
  deletion_protection          = "${var.ibsdb_cluster_delete_protect}"

  vpc_security_group_ids = [
    "${aws_security_group.ibs_aurora.id}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-ibsdb_cluster"
    )
  )}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster_instance" "ibsdb_instance" {
  count                = "1"
  identifier           = "${var.environment}-ibsdb-${count.index}"
  cluster_identifier   = "${aws_rds_cluster.ibsdb_cluster.id}"
  instance_class       = "${var.ibs_rds_instance_class}"
  db_subnet_group_name = "${aws_db_subnet_group.ibsdb.name}"
  publicly_accessible  = true

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-ibsdb_instance"
    )
  )}"

  lifecycle {
    create_before_destroy = true
  }
}
