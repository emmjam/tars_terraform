# SG's for the tars core servers
resource "aws_security_group" "tars-core-backend" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-core-backend"
  description = "TARS Core Backend"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-core-backend"
      ),
    )
  )}"
}

resource "aws_security_group" "tars-core-frontend" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-core-frontend"
  description = "TARS Core Frontend"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-core-frontend"
      ),
    )
  )}"
}