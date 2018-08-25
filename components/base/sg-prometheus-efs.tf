resource "aws_security_group" "prometheus-efs" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "prometheus-efs"
  )}"

  description = "Prometheus EFS"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "prometheus-efs"
      ),
    )
  )}"
}