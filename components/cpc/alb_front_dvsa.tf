# CPC FRONT DVSA ALB 
resource "aws_alb" "cpc-front-dvsa" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "dvsa"
  )}"

  internal = true

  security_groups = ["${aws_security_group.cpc-front-dvsa-alb.id}"]

  subnets = ["${module.cpc-front.subnet_ids}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "dvsa"
      ),
    )
  )}"
}

