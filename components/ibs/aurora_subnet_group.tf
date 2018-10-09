# ibsdb subnet group
resource "aws_db_subnet_group" "ibsdb" {
  name        = "${local.csi}-ibsdb"
  description = "${local.csi}-ibs"

  subnet_ids = [
    "${data.terraform_remote_state.base.subnets_ibs_db}"
  ]
}
