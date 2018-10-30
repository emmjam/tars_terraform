# SG for the TARS RSIS RDS DB
resource "aws_security_group" "tars-rsis-db" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-rsis-db"
  description = "TARS RSIS DB"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-rsis-db"
      ),
    )
  )}"
}
