# Create a source endpoint
resource "aws_dms_endpoint" "tarssource" {
  endpoint_id                 = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "tarssource"
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
        "tarssource"
      ),
    )
  )}"

  username = "${var.source_dms_tars_rds_username}"
  password = "${var.source_dms_tars_rds_password}"
  server_name = "${aws_db_instance.source_tarsdb_dms.address}"
  database_name = "${var.source_dms_tars_rds_name}"
}