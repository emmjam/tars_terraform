# Create a source endpoint
resource "aws_dms_endpoint" "rsisssource" {
  endpoint_id                 = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "rsissource"
  )}"
  endpoint_type               = "source"
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
        "rsisssource"
      ),
    )
  )}"

  username = "${var.source_dms_rsis_rds_username}"
  password = "${var.source_dms_rsis_rds_password}"
  server_name = "${aws_db_instance.source_rsisdb_dms.address}"
  database_name = "${var.source_dms_rsis_rds_name}"
}