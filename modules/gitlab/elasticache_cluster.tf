resource "aws_elasticache_cluster" "gitlab" {
  cluster_id = "${format(
    "%s-%s-%s%s",
    var.project,
    var.environment,
    var.component,
    var.name,
  )}"

  engine               = "redis"
  engine_version       = "${var.redis_engine_version}"
  parameter_group_name = "${var.redis_parameter_group_name}"
  node_type            = "${var.redis_node_type}"
  port                 = 6379
  num_cache_nodes      = 1

  maintenance_window       = "${var.redis_maintenance_window}"
  snapshot_window          = "${var.redis_snapshot_window}"
  snapshot_retention_limit = "${var.redis_snapshot_retention_limit}"

  security_group_ids = ["${aws_security_group.redis.id}"]
  subnet_group_name  = "${aws_elasticache_subnet_group.gitlab.name}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.name,
      ),
      "Module", var.module
    )
  )}"
}
