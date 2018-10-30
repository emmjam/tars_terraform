# SG for the TARS MIS RDS DB
resource "aws_security_group" "tars-mis-db" {
  name        = "${var.project}-${var.environment}-${var.component}-tars-mis-db"
  description = "TARS MIS DB"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-mis-db"
      ),
    )
  )}"
}
