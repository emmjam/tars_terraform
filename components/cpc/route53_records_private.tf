# Added by TS-4753
# To be removed by TS-4722 and TS-4756

# Create the R53 record for the CPC DB
resource "aws_route53_record" "cpcdb" {
  name    = "cpc-core-db"
  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${var.uat_dbs_in_prod == "true"
                              ? element(concat(aws_db_instance.tmp_cpcdb.*.address, list("")), 0)
                              : element(concat(aws_db_instance.cpcdb.*.address, list("")), 0)
                              }"    
    zone_id                = "${var.uat_dbs_in_prod == "true"
                              ? element(concat(aws_db_instance.tmp_cpcdb.*.hosted_zone_id, list("")), 0)
                              : element(concat(aws_db_instance.cpcdb.*.hosted_zone_id, list("")), 0)
                              }"
    evaluate_target_health = true
  }
}

# Leaving this here to be put back on go live
# Added by TS-4753
# To be removed by TS-4722 and TS-4756
# Create the R53 record for the CPC DB
# resource "aws_route53_record" "cpcdb" {
#   name    = "cpc-core-db"
#   zone_id = "${data.terraform_remote_state.base.private_zone_id}"
#   type    = "A"

#   alias {
#     name                   = "${aws_db_instance.cpcdb.address}"
#     zone_id                = "${aws_db_instance.cpcdb.hosted_zone_id}"
#     evaluate_target_health = true
#   }
# }

# Create the R53 record for the CPC Backend ALB
resource "aws_route53_record" "cpc-backend" {
  name    = "cpc-backend"
  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.cpc-back.dns_name}"
    zone_id                = "${aws_alb.cpc-back.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "cpc-dvsa" {
  name    = "cpc-dvsa"
  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.cpc-front-dvsa.dns_name}"
    zone_id                = "${aws_alb.cpc-front-dvsa.zone_id}"
    evaluate_target_health = true
  }
}
