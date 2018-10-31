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

  # TODO: peacheym: Lots of tech debt here. Some things think the domain
  #                 name is environment.private, some think it is
  #                 component.environment.private; and in any case
  #                 it should be environment.public, with split
  #                 horizon as necessary to have public and private records
  #                 in a private hosted zone, but only public records
  #                 in a public hosted zone.
  #                 For now, this local allows for the best generic
  #                 code deduplication.
  vpc_domain_name = "${var.environment}.${var.private_domain_name}"
}
