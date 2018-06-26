# Create the R53 record for the TARS DB
resource "aws_route53_record" "ibsdb" {
  name = "${format(
    "%s-%s",
    var.component,
    "db"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_rds_cluster.ibsdb_cluster.endpoint}"
    zone_id                = "${aws_rds_cluster.ibsdb_cluster.hosted_zone_id}"
    evaluate_target_health = true
  }
}
