resource "aws_security_group" "tars-core-batch" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-core-batch"
  description = "TARS Core Batch"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-core-batch"
      ),
    )
  )}"
}
