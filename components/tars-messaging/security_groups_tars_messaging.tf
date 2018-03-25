# SG for the messaging server
resource "aws_security_group" "tars-messaging" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-messaging"
  description = "TARS Messaging"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-messaging"
      ),
    )
  )}"
}
