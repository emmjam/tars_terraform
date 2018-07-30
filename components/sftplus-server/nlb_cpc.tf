# sftplus Server internal
resource "aws_lb" "sftpplus-svr-private" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    var.component
  )}"

  internal = false
  security_groups = ["${aws_security_group.sftpplus_svr-cpc-lb.id}"]
  subnets = ["${data.terraform_remote_state.base.subnets_sftplus_svr}"]
  load_balancer_type = "network"

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
    )
  )}"
}

