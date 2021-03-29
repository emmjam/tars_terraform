resource "aws_elasticache_subnet_group" "gitlab" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
  )

  description = "ElasticCache subnet group for GitLab"
  subnet_ids = module.redis_subnets.subnet_ids
}