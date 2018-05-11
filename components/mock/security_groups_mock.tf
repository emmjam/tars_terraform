# SG for TARS mock server
resource "aws_security_group" "tars-mock" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-mock"
  description = "TARS mock"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-mock"
      ),
    )
  )}"
}
