################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "tarsdb" {
  name        = "${local.csi}-tarsdb"
  description = "${local.csi}-tarsdb"
  family      = "oracle-se2-12.1"
}
