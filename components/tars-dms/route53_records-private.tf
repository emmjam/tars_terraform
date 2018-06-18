# Create the R53 record for the Capita UAT RAC DB
resource "aws_route53_record" "capita_uat_rac01" {
  name = "dsa-drora-db-rac01"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"
  ttl     = "60"
  records = ["${var.dsa-drora-db-rac01}"]
}

resource "aws_route53_record" "capita_uat_rac02" {
  name = "dsa-drora-db-rac02"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"
  ttl     = "60"
  records = ["${var.dsa-drora-db-rac02}"]
}

resource "aws_route53_record" "capita_uat_rac03" {
  name = "dsa-drora-db-rac03"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"
  ttl     = "60"
  records = ["${var.dsa-drora-db-rac03}"]
}