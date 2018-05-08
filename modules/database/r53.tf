#RDS DNS Name
resource "aws_route53_record" "db_cname" {
  zone_id = "${var.zone_id}"
  name    = "${var.name}"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_db_instance.database.address}"]
}
