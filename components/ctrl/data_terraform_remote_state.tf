data "terraform_remote_state" "acc" {
  backend = "s3"

  config {
    bucket = "${var.tf_state_bucket_prefix}-${data.aws_caller_identity.current.account_id}-${var.aws_region}"

    key = "${format(
      "%s/%s/%s/%s/%s.tfstate",
      var.project,
      data.aws_caller_identity.current.account_id,
      var.aws_region,
      var.environment,
      "acc"
    )}"

    region = "${var.aws_region}"
  }
}

data "terraform_remote_state" "mgmt" {
  backend = "s3"

  config {
    bucket = "${var.tf_state_bucket_prefix}-${var.mgmt_aws_account_id}-${var.aws_region}"

    key = "${format(
      "%s/%s/%s/%s/%s.tfstate",
      var.project,
      var.mgmt_aws_account_id,
      var.aws_region,
      "mgmt",
      "mgmt"
    )}"

    region = "${var.aws_region}"
  }
}
