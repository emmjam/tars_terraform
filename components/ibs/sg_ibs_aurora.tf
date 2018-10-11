# TODO: peacheym: Choose either db or aurora,
#                 and standardise
resource "aws_security_group" "ibs_aurora" {
  name        = "${local.csi}/ibs-db"
  description = "${local.csi}/ibs-db"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/ibs-db"
    )
  )}"
}
