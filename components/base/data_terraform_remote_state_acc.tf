# Get the remote state of the acc component
data "terraform_remote_state" "acc" {
  backend = "s3"

  config = {
    # TODO: peacheym: Make this an explicit variable value, or a local.
    bucket = "${var.tf_state_bucket_prefix}-${data.aws_caller_identity.current.account_id}-${var.aws_region}"
    key = format(
      "%s/%s/%s/%s/%s.tfstate",
      var.project,
      data.aws_caller_identity.current.account_id,
      var.aws_region,
      var.account_environment,
      var.account_component_name,
    )
    region = var.aws_region
  }
}

