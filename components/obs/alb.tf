# OBS ALB
resource "aws_alb" "obs" {
  name         = "${local.csi}-obs"
  internal     = false
  idle_timeout = 300

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "public"
    enabled = true
  }

  security_groups = [
    "${aws_security_group.obs-alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_alb_public}",
  ]

  idle_timeout = 300

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-obs"
    )
  )}"
}
