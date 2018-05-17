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

  username = "change_me"
  password = "change_me"
  server_name = "change_me"
  database_name = "change_me"
}