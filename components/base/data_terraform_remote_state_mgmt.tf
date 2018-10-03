# Get the remote state of the acc component
data "terraform_remote_state" "mgmt" {
  backend = "s3"

  config {
    # TODO: peacheym: Make this an explicit variable value, or a local.
    bucket = "${var.tf_state_bucket_prefix}-${var.mgmt_aws_account_id}-${var.mgmt_aws_region}"

    key = "${format(
      "%s/%s/%s/%s/%s.tfstate",
      var.mgmt_project,
      var.mgmt_aws_account_id,
      var.mgmt_aws_region,
      var.mgmt_environment,
      var.mgmt_component
    )}"

    region = "${var.mgmt_aws_region}"
  }
}
