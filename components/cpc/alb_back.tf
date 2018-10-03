# CPC Back ALB 
resource "aws_alb" "cpc-back" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpc-back"
  )}"

  internal = true

  security_groups = ["${aws_security_group.cpc-back-alb.id}"]

  subnets = ["${module.cpc-back.subnet_ids}"]
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "cpc-back"
      ),
    )
  )}"
}

