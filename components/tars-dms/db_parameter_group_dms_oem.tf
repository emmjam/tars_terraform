resource "aws_db_parameter_group" "dms_oem" {
  name   = "dms-oem-pg"
  family = "oracle-se2-12.1"

  parameter {
    name         = "sqlnetora.sqlnet.inbound_connect_timeout"
    value        = "120"
    apply_method = "immediate"
  }
}
