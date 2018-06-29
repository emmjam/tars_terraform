# SG for the TARS Public ALB
resource "aws_security_group" "irdt-alb-public" {
  name        = "${var.project}-${var.environment}-irdt-tars-alb-public"
  description = "IRDT ALB Public Facing"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        "irdt",
        "irdt-alb-public"
      ),
    )
  )}"
}
