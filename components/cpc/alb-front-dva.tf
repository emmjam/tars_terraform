# CPC FRONT DVA ALB 
resource "aws_alb" "cpc-front-dva" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "dva"
  )}"

  internal = false

  security_groups = ["${aws_security_group.cpc-front-dva-alb.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "dva"
      ),
    )
  )}"
}

