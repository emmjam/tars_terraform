resource "aws_alb" "tars-alb-backend-payments" {
  name     = "${local.csi}-payments"
  internal = false
  idle_timeout = 300

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "payments-backend"
    enabled = true
  }

  security_groups = [
    "${aws_security_group.tars-alb-backend-payments.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_alb_public}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/backend-payments"
    )
  )}"
}

