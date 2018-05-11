# SG for TARS mock ALB
resource "aws_security_group" "tars-alb-mock" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-alb-mock"
  description = "TARS ALB mock"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-alb-mock"
      ),
    )
  )}"
}
