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
      "Version"   = var.release_version
    },
  )

  asg_default_tags = concat(
    var.asg_default_tags,
    [
      {
        "key"                 = "Version"
        "value"               = var.release_version
        "propagate_at_launch" = "true"
      },
    ],
  )

  vpc_domain_name = "${var.environment}.${var.private_domain_name}"

  obs_log = format(
    "/aws/ec2/%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "obs/cloud-init-output",
  )

  ibs_log = format(
    "/aws/ec2/%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "ibs/cloud-init-output",
  )

  fyndi_back_log = format(
    "/aws/ec2/%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "fyndi-back/cloud-init-output",
  )

  fyndi_front_log = format(
    "/aws/ec2/%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "fyndi-front/cloud-init-output",
  )
}

