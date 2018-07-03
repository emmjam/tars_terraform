# FYNDI ALBs
resource "aws_alb" "fyndi-f" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "fyndi-f"
  )}"

  internal = false

  security_groups = ["${aws_security_group.fyndi-f-alb.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "fyndi-f"
      ),
    )
  )}"
}

resource "aws_alb" "fyndi-b" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "fyndi-b"
  )}"

  internal = false

  security_groups = ["${aws_security_group.fyndi-b-alb.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "fyndi-b"
      ),
    )
  )}"
}
