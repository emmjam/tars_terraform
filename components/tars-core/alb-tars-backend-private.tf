# ALB for the tars core backend
resource "aws_alb" "tars-alb-backend-private" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "backend"
  )}"

  internal = true

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "private-backend"
    enabled = true
  }

  security_groups = ["${aws_security_group.tars-alb-backend.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_tars_backend}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "backend-private"
      ),
    )
  )}"
}
