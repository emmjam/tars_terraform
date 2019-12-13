resource "aws_route53_record" "db" {
  name    = "sonar-db"
  zone_id = var.route53_zone
  type    = "A"

  alias {
    name                   = aws_db_instance.sonarqube.address
    zone_id                = aws_db_instance.sonarqube.hosted_zone_id
    evaluate_target_health = true
  }
}

