# SG for the messaging server
resource "aws_security_group" "tars-messaging-ad" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-msg-ad"
  description = "TARS Messaging AD"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-msg-ad"
      ),
    )
  )}"
}
