# Get the remote state for the base component
data "terraform_remote_state" "base" {
  backend = "s3"

  config {
    bucket = "${var.tf_state_bucket_prefix}-${data.aws_caller_identity.current.account_id}-${var.region}"

    key = "${format(
      "%s/%s/%s/%s/%s.tfstate",
      var.project,
      data.aws_caller_identity.current.account_id,
      var.region,
      "dev01",
      "base"
    )}"

    region = "${var.region}"
  }
}
