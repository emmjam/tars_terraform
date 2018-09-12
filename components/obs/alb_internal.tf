# IBS ALB
resource "aws_alb" "obs_internal" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "obs-internal"
  )}"

  internal = true

  security_groups = ["${aws_security_group.obs_internal-alb.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "obs_internal"
      ),
    )
  )}"
}

