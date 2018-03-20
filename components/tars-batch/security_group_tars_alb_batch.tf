resource "aws_security_group" "tars-alb-batch" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-alb-batch"
  description = "TARS ALB Batch"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-alb-batch"
      ),
    )
  )}"
}
