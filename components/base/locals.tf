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
  
  authorization = "${var.authorisation_enabled ? "CUSTOM" : "NONE"}"
  stage_name = "${var.stage_name == "" ? var.environment : var.stage_name}"
  stage_description = ""
  api_private_stage_name = "${var.api_private_stage_name == "" ? var.environment : var.api_private_stage_name}"
  
  vpc_domain_name = "${var.environment}.${var.private_domain_name}"
  vpc_domain_name_aws = "${var.environment}.${var.private_domain_name_aws}"

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


