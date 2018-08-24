# sftplus Server public
resource "aws_lb" "sftpplus-svr-public" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    var.component
  )}"

  internal = false
  subnets = ["${var.cpc_sftp_subnets_cidrs}"]
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

