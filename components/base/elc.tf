resource "aws_elasticache_subnet_group" "main" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "main"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "main"
  )}"

  subnet_ids = [
    "${module.elc_subnets.subnet_ids}",
  ]
}

resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.project}-${var.environment}-${var.component}-main" 
  engine               = "${var.elc_main_engine}"
  engine_version       = "${var.elc_main_engine_version}"
  node_type            = "${var.elc_main_node_type}"
  num_cache_nodes      = "${var.elc_main_cache_nodes}"
  parameter_group_name = "${var.elc_main_parameter_group}"
  port                 = "${var.elc_main_port}"
  subnet_group_name    = "${aws_elasticache_subnet_group.main.id}"

  security_group_ids = [
    "${aws_security_group.elc_main.id}",
  ]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        "main"
      ),
      "Component", var.component
    )
  )}"
}

