# Create the R53 record for the TARS DB

# TS-4753
resource "aws_route53_record" "tarsdb" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    "core",
    "db"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${var.uat_dbs_in_prod == "true"
                              ? element(concat(aws_db_instance.tmp_tarsdb.*.address, list("")), 0)
                              : element(concat(aws_db_instance.tarsdb.*.address, list("")), 0)
                              }"
    zone_id                = "${var.uat_dbs_in_prod == "true"
                              ? element(concat(aws_db_instance.tmp_tarsdb.*.hosted_zone_id, list("")), 0)
                              : element(concat(aws_db_instance.tarsdb.*.hosted_zone_id, list("")), 0)
                              }"
    evaluate_target_health = true
  }
}

# Leaving this here to be put back on go live
# Added by TS-4753
# To be removed by TS-4722 and TS-4756
# resource "aws_route53_record" "tarsdb" {
#   name = "${format(
#     "%s-%s-%s",
#     var.project,
#     "core",
#     "db"
#   )}"

#   zone_id = "${data.terraform_remote_state.base.private_zone_id}"
#   type    = "A"

#   alias {
#     name                   = "${aws_db_instance.tarsdb.address}"
#     zone_id                = "${aws_db_instance.tarsdb.hosted_zone_id}"
#     evaluate_target_health = true
#   }
# }


# Create the R53 record for the TARS Backend ALB
resource "aws_route53_record" "tars-backend" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    "core",
    "backend"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-backend-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-backend-private.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tars-private" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    "core",
    "private"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-private-facing.dns_name}"
    zone_id                = "${aws_alb.tars-private-facing.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "pearsonssftp" {
  name    = "pearsonssftp"
  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "CNAME"
  ttl     = "600"

  records = [
    "sftpuk2.pearsonvue.com",
  ]
}
