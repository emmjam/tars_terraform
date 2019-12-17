locals {
  # Compound Scope Identifier
  csi = replace(
    format("%s-%s-%s", var.project, var.environment, var.component),
    "_",
    "",
  )

  # CSI for use in resources with a global namespace, i.e. S3 Buckets
  csi_global = replace(
    format(
      "%s-%s-%s-%s-%s",
      var.project,
      var.aws_account_id,
      var.aws_region,
      var.environment,
      var.component,
    ),
    "_",
    "",
  )

  default_tags = merge(
    var.default_tags,
    {
      "Component" = var.component
    },
  )

  asg_default_tags = concat(
    var.asg_default_tags,
    [
      {
        "key"                 = "Component"
        "value"               = var.component
        "propagate_at_launch" = "true"
      },
    ],
  )

  vpc_domain_name = "${var.environment}.${var.private_domain_name}"

  jenkinsnode_log = format(
    "/aws/ec2/%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkinsnode/cloud-init-output",
  )

  jmeter_log = format(
    "/aws/ec2/%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jmeter/cloud-init-output",
  )

  prometheus_log = format(
    "/aws/ec2/%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "prometheus/cloud-init-output",
  )
}

