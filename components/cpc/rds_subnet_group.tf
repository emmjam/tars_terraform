# tarsdb subnet group
resource "aws_db_subnet_group" "cpcdb" {
  name        = "${local.csi}-cpcdb"
  description = "${local.csi}-cpcdb"

  subnet_ids = data.terraform_remote_state.base.outputs.subnets_cpc_db
}

