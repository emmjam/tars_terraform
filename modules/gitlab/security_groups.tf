# GITLAB #############################################################

resource "aws_security_group_rule" "gitlab_ingress_elb_8888" {
  description              = "Allow TCP/8888 from ELB Public"
  type                     = "ingress"
  from_port                = 8888
  to_port                  = 8888
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.security_group_id}"
  source_security_group_id = "${aws_security_group.elb.id}"
}

resource "aws_security_group_rule" "gitlab_ingress_elb_ssh" {
  description              = "Allow TCP/22 from ELB Public"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.security_group_id}"
  source_security_group_id = "${aws_security_group.elb.id}"
}

resource "aws_security_group_rule" "gitlab_ingress_elb_private_ssh" {
  description              = "Allow TCP/22 from ELB Private"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.security_group_id}"
  source_security_group_id = "${aws_security_group.elb_private.id}"
}

resource "aws_security_group_rule" "gitlab_ingress_elb_private_8888" {
  description              = "Allow TCP/8888 from ELB Private"
  type                     = "ingress"
  from_port                = 8888
  to_port                  = 8888
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.security_group_id}"
  source_security_group_id = "${aws_security_group.elb_private.id}"
}

resource "aws_security_group_rule" "gitlab_egress_db_5432" {
  description              = "Allow TCP/5432 to Postgres DB"
  type                     = "egress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.security_group_id}"
  source_security_group_id = "${aws_security_group.db.id}"
}

resource "aws_security_group_rule" "gitlab_egress_internet_https" {
  description       = "Allow TCP/443 to Internet"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${module.gitlab.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "gitlab_egress_redis_6379" {
  description              = "Allow TCP/6379 to Redis"
  type                     = "egress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.security_group_id}"
  source_security_group_id = "${aws_security_group.redis.id}"
}

# ELB PUBLIC #############################################################

resource "aws_security_group" "elb" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "elb"
  )}"

  description = "SG for ${var.project}-${var.environment}-${var.component}-${var.name}-elb"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name,
        "elb"
      ),
      "Module", var.module
    )
  )}"
}

resource "aws_security_group_rule" "elb_ingress_whitelisted_ips_web" {
  description       = "Allow TCP/${var.elb_public_port} from whitelisted IPs"
  type              = "ingress"
  from_port         = "${var.elb_public_port}"
  to_port           = "${var.elb_public_port}"
  protocol          = "tcp"
  security_group_id = "${aws_security_group.elb.id}"
  cidr_blocks       = ["${var.gitlab_whitelist}"]
}

resource "aws_security_group_rule" "elb_ingress_whitelisted_ips_ssh" {
  description       = "Allow TCP/22 from whitelisted IPs"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.elb.id}"
  cidr_blocks       = ["${var.gitlab_whitelist}"]
}

resource "aws_security_group_rule" "elb_egress_gitlab_8888" {
  description              = "Allow TCP/8888 to GitLab"
  type                     = "egress"
  from_port                = 8888
  to_port                  = 8888
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.elb.id}"
  source_security_group_id = "${module.gitlab.security_group_id}"
}

resource "aws_security_group_rule" "elb_egress_gitlab_22" {
  description              = "Allow TCP/22 to GitLab"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.elb.id}"
  source_security_group_id = "${module.gitlab.security_group_id}"
}

# ELB PRIVATE #############################################################

resource "aws_security_group" "elb_private" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "elb-private"
  )}"

  description = "SG for ${var.project}-${var.environment}-${var.component}-${var.name}-elb-private"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name,
        "elb-private"
      ),
      "Module", var.module
    )
  )}"
}

resource "aws_security_group_rule" "elb_private_egress_gitlab_ssh" {
  description              = "Allow TCP/22 to GitLab"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.elb_private.id}"
  source_security_group_id = "${module.gitlab.security_group_id}"
}

resource "aws_security_group_rule" "elb_private_egress_gitlab_8888" {
  description              = "Allow TCP/8888 to GitLab"
  type                     = "egress"
  from_port                = 8888
  to_port                  = 8888
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.elb_private.id}"
  source_security_group_id = "${module.gitlab.security_group_id}"
}

# DB #############################################################

resource "aws_security_group" "db" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "db"
  )}"

  description = "SG for ${var.project}-${var.environment}-${var.component}-${var.name}-db"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name,
        "db"
      ),
      "Module", var.module
    )
  )}"
}

resource "aws_security_group_rule" "db_ingress_gitlab_5432" {
  description              = "Allow TCP/5432 from GitLab"
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.db.id}"
  source_security_group_id = "${module.gitlab.security_group_id}"
}

# REDIS #############################################################

resource "aws_security_group" "redis" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "redis"
  )}"

  description = "SG for ${var.project}-${var.environment}-${var.component}-${var.name}-redis"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name,
        "redis"
      ),
      "Module", var.module
    )
  )}"
}

resource "aws_security_group_rule" "redis_ingress_gitlab_6379" {
  description              = "Allow TCP/6379 from GtiLab"
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.redis.id}"
  source_security_group_id = "${module.gitlab.security_group_id}"
}
