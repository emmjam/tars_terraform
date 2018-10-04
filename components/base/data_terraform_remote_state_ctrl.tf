data "terraform_remote_state" "ctrl" {
  backend = "s3"

  config {
    # TODO: peacheym: Make this an explicit variable value, or a local.
    bucket = "${var.tf_state_bucket_prefix}-${var.aws_account_id}-${var.aws_region}"

    key = "${format(
      "%s/%s/%s/%s/%s.tfstate",
      var.project,
      var.aws_account_id,
      var.aws_region,
      var.account_environment,
      "ctrl"
    )}"

    region = "${var.aws_region}"
  }
}
