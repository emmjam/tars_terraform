resource "aws_security_group" "main" {
  name = "${format(
    "%s/%s",
    local.csi,
    var.name
  )}"

  description = "${format(
    "%s/%s",
    local.csi,
    var.name
  )}"

  vpc_id = "${var.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", format(
        "%s/%s",
        local.csi,
        var.name 
      )
    )
  )}"
}
