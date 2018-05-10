# OBS ALB 
resource "aws_alb" "obs" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "obs"
  )}"

  internal = false

  security_groups = ["${aws_security_group.obs-alb.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "obs"
      ),
    )
  )}"
}

