# Create a source endpoint
resource "aws_dms_endpoint" "tarstarget" {
  endpoint_id                 = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "tarstarget"
  )}"
  endpoint_type               = "target"
  engine_name                 = "oracle"
  extra_connection_attributes = ""
  port                        = 1521

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tarstarget"
      ),
    )
  )}"

  username = "${var.target_dms_tars_rds_username}"
  password = "${var.target_dms_tars_rds_password}"
  server_name = "${aws_db_instance.target_tarsdb_dms.address}"
  database_name = "${var.target_dms_tars_rds_name}"
}