# sftplus Server internal
resource "aws_lb" "sftpplus-svr-private" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpc"
  )}"

  internal = true
  subnets = ["${module.sftpplus_svr.subnet_ids}"]
  load_balancer_type = "network"

  idle_timeout = "300"

  enable_deletion_protection = true

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

