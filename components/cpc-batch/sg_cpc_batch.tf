resource "aws_security_group" "cpc_batch" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpc-batch"
  )}"

  description = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpc-batch"
  )}"

  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    "${var.default_tags}",
    map(
      "Name", format(
        "%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        "cpc-batch"
      ),
    )
  )}"
}
