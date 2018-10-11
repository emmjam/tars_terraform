# IBS ALB
resource "aws_alb" "ibs" {
  name = "${local.csi}-ibs"

  internal = false
  idle_timeout = 300

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "public"
    enabled = true
  }

  security_groups = [
    "${aws_security_group.ibs-alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_alb_public}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/ibs"
    )
  )}"
}
