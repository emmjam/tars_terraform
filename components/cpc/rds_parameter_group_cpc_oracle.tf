################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "cpcdb" {
  name        = "${local.csi}-cpcdb"
  description = "${local.csi}-cpcdb"
  family      = "oracle-se2-12.1"
}
