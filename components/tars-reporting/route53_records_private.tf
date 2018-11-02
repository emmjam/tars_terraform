# Create the R53 record for the MIS DB

# TS-4753
resource "aws_route53_record" "misdb" {
  name    = "tars-mis-db"
  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${var.uat_dbs_in_prod == "true"
                              ? element(concat(aws_db_instance.tmp_misdb.*.address, list("")), 0)
                              : element(concat(aws_db_instance.misdb.*.address, list("")), 0)
                              }"
    zone_id                = "${var.uat_dbs_in_prod == "true"
                              ? element(concat(aws_db_instance.tmp_misdb.*.hosted_zone_id, list("")), 0)
                              : element(concat(aws_db_instance.misdb.*.hosted_zone_id, list("")), 0)
                              }"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "rsisdb" {
  name    = "tars-rsis-db"
  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${var.uat_dbs_in_prod == "true"
                              ? element(concat(aws_db_instance.tmp_rsisdb.*.address, list("")), 0)
                              : element(concat(aws_db_instance.rsisdb.*.address, list("")), 0)
                              }"
    zone_id                = "${var.uat_dbs_in_prod == "true"
                              ? element(concat(aws_db_instance.tmp_rsisdb.*.hosted_zone_id, list("")), 0)
                              : element(concat(aws_db_instance.rsisdb.*.hosted_zone_id, list("")), 0)
                              }"
    evaluate_target_health = true
  }
}

# Leaving this here to be put back on go live
# Added by TS-4753
# To be removed by TS-4722 and TS-4756
# resource "aws_route53_record" "misdb" {
#   name    = "tars-mis-db"
#   zone_id = "${data.terraform_remote_state.base.private_zone_id}"
#   type    = "A"

#   alias {
#     name                   = "${aws_db_instance.misdb.address}"
#     zone_id                = "${aws_db_instance.misdb.hosted_zone_id}"
#     evaluate_target_health = true
#   }
# }

# resource "aws_route53_record" "rsisdb" {
#   name    = "tars-rsis-db"
#   zone_id = "${data.terraform_remote_state.base.private_zone_id}"
#   type    = "A"

#   alias {
#     name                   = "${aws_db_instance.rsisdb.address}"
#     zone_id                = "${aws_db_instance.rsisdb.hosted_zone_id}"
#     evaluate_target_health = true
#   }
# }
