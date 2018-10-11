# FYNDI ALBs
resource "aws_alb" "fyndi-f" {
  name         = "${local.csi}-fyndi-f"
  internal     = false
  idle_timeout = 300

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "front"
    enabled = true
  }

  security_groups = [
    "${aws_security_group.fyndi-f-alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_alb_public}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-fyndi-f"
    )
  )}"
}

resource "aws_alb" "fyndi-b" {
  name         = "${local.csi}-fyndi-b"
  internal     = true
  idle_timeout = 300

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "back"
    enabled = true
  }

  security_groups = [
    "${aws_security_group.fyndi-b-alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_fyndi_back_alb}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-fyndi-b"
    )
  )}"
}
