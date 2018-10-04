locals {
  # Compound Scope Identifier
  csi = "${replace(
    format(
      "%s-%s-%s",
      var.project,
      var.environment,
      var.component
    ),
    "_",
    ""
  )}"

  # CSI for use in resources with a global namespace, i.e. S3 Buckets
  csi_global = "${replace(
    format(
      "%s-%s-%s-%s-%s",
      var.project,
      var.aws_account_id,
      var.aws_region,
      var.environment,
      var.component
    ),
    "_",
    ""
  )}"

  default_tags = "${merge(
    var.default_tags,
    map(
      "Component", var.component
    )
  )}"

  vpc_domain_name = "${var.environment}.${var.private_domain_name}"

  # If environment = prod, just use component, else use component-environment
  default_short_name = "${var.component}-${var.environment}"
  dva_dns_short_name = "${var.environment == "prod" ? var.component : local.default_short_name}"
}
