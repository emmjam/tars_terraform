# ibsdb subnet group
resource "aws_db_subnet_group" "ibsdb" {
  name        = "${var.project}-${var.environment}-ibs-ibsdb"
  description = "${local.csi}-ibs"

  subnet_ids = data.terraform_remote_state.base.outputs.subnets_ibs_db
}

