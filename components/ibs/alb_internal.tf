# IBS ALB
resource "aws_alb" "ibs_internal" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "ibs-internal"
  )}"

  internal = true

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "internal"
    enabled = true
  }


  security_groups = ["${aws_security_group.ibs_internal-alb.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "ibs_internal"
      ),
    )
  )}"
}

