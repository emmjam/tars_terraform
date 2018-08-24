resource "aws_security_group" "sftpplus_svr-dva-lb" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "sftpplus-svr-dva"
  )}"

  description = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "sftpplus-svr-dva"
  )}"

  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "sftpplus-svr"
      ),
      "Component", var.component
    )
  )}"
}
