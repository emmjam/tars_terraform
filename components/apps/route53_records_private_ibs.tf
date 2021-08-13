# Create the R53 record for the TARS DB
resource "aws_route53_record" "ibsdb" {
  name    = "ibs-db"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id_aws
  type    = "CNAME"

  alias {
    name                   = aws_rds_cluster.ibsdb_cluster.endpoint
    zone_id                = aws_rds_cluster.ibsdb_cluster.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "ibsdb_dvsacloud" {
  name    = "ibs-db"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "CNAME"

  alias {
    name                   = aws_rds_cluster.ibsdb_cluster.endpoint
    zone_id                = aws_rds_cluster.ibsdb_cluster.hosted_zone_id
    evaluate_target_health = true
  }
}
