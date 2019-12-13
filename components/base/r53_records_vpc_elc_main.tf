# Record 'name' left as "-web" for backwards compatability.
resource "aws_route53_record" "elc-main-CNAME" {
  zone_id = aws_route53_zone.vpc.zone_id
  name    = "elasticache.cfg.main"
  type    = "CNAME"
  ttl     = "30"

  records = [
    aws_elasticache_cluster.ec.cluster_address,
  ]
}

