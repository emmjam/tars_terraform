# ALB for public facing tars
resource "aws_alb" "tars-private-facing" {
  name     = "${local.csi}-private"
  internal = "true"

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "private-frontend"
    enabled = true
  }

  security_groups = [
    "${aws_security_group.tars-alb-private.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_tars_web}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/private"
    )
  )}"
}
