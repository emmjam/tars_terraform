# Create a source endpoint
resource "aws_dms_endpoint" "rsistargetonprem" {
  endpoint_id                 = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "rsistargetonprem"
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
        "rsistargetonprem"
      ),
    )
  )}"

  username = "${var.target_dms_rsis_rds_username}"
  password = "${var.target_dms_rsis_rds_password}"
  server_name = "${aws_db_instance.target_rsisdb_dms_on_prem.address}"
  database_name = "${var.target_dms_rsis_rds_name}"
}