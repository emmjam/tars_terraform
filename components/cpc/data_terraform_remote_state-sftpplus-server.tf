data "terraform_remote_state" "sftpplusserver" {
  backend = "s3"

  config {
    bucket = "${var.tf_state_bucket_prefix}-${var.aws_account_id}-${var.aws_region}"

    key = "${format(
      "%s/%s/%s/%s/%s.tfstate",
      var.project,
      var.aws_account_id,
      var.aws_region,
      var.account_environment,
      "sftpplusserver"
    )}"

    region = "${var.aws_region}"
  }
}
