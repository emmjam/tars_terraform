resource "aws_cloudwatch_log_group" "ec2" {
  count = "${length(var.cwl_names)}"

  name = "${format(
    "/aws/ec2/%s/%s%s",
    local.csi,
    var.name,
    element(
      var.cwl_names,
      count.index
    )
  )}"

  retention_in_days = "${var.cwl_retention_days}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", format(
        "/aws/ec2/%s/%s%s",
        local.csi,
        var.name,
        element(
          var.cwl_names,
          count.index
        )
      )
    )
  )}"
}
