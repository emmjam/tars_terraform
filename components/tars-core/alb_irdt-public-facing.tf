# ALB for public facing tars
resource "aws_alb" "irdt-public-facing" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "irdt",
    "public"
  )}"

  internal = "false"

  security_groups = ["${aws_security_group.irdt-alb-public.id}"]

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "public-frontend"
    enabled = true
  }

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        "irdt",
        "public"
      ),
    )
  )}"
}
