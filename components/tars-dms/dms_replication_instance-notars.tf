# Create a new replication instance
resource "aws_dms_replication_instance" "tars_dms_replication_instance-notars" {
  replication_instance_id      = "${format(
    "%s-%s-%s-%s",
    var.project,
    "onprem",
    "${var.environment == "dev01" ? "uat" : var.environment}",
    "notars"
  )}"

  allocated_storage            = "${var.tars_dms_allocated_storage}"
  apply_immediately            = "${var.tars_dms_apply_immediately}"
  auto_minor_version_upgrade   = "${var.tars_dms_auto_minor_version_upgrade}"
  engine_version               = "${var.tars_dms_engine_version}"
  kms_key_arn                  = "${data.aws_kms_alias.dms.target_key_arn}"
  multi_az                     = "${var.tars_dms_multi_az}"
  preferred_maintenance_window = "${var.tars_dms_maint_window}"
  publicly_accessible          = "${var.tars_dms_publicly_accessible}"
  replication_instance_class   = "${var.tars_dms_replication_instance_class}"
  replication_subnet_group_id  = "${aws_dms_replication_subnet_group.tars_dms_replication.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s-%s",
        var.project,
        "onprem",
        "${var.environment == "dev01" ? "uat" : var.environment}",
        "notars"
      ),
    )
  )}"

  vpc_security_group_ids = [
    "${aws_security_group.tars-dms.id}",
  ]
}