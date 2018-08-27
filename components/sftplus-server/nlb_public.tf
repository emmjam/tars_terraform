# sftplus Server public
resource "aws_lb" "sftpplus-svr-public" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "public"
  )}"

  internal = false
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

