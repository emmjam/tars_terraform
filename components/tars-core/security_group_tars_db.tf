# SG for the TARS RDS DB
resource "aws_security_group" "tars-core-db" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-core-db"
  description = "TARS Core DB"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-core-db"
      ),
    )
  )}"
}
