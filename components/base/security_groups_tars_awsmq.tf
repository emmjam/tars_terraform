# SG for the AWS MQ Service
resource "aws_security_group" "tars-awsmq" {
  name        = "${var.project}-${var.environment}-${var.component}-awsmq"
  description = "TARS AWS MQ"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "awsmq"
      ),
    )
  )}"
}
