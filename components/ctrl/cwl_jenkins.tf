resource "aws_cloudwatch_log_group" "jenkins" {
  name = format(
    "/aws/ec2/${local.csi}/%s",
    "jenkins",

  )

  retention_in_days = var.cwl_retention_days

  tags = merge(
    local.default_tags,
    {
      "Name" = format(
        "/aws/ec2/${local.csi}/%s",
        "jenkins",
      )
      "Component" = var.component
    },
  )
}

