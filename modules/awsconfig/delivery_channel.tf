# The AWS Config Deliver Channel that is configured to
# write AWS Config output to the S3 bucket created by this module.
# The AWS Config Recorder cannot be enabled until this channel
# is in place and therefore the Recorder Status resource
# explicitly depends upon this one.
resource "aws_config_delivery_channel" "main" {
  name = "default"

  /*
  # Ideally we would construct the name in the manner below, however
  # as we want to import GUI-created delivery channels which use the name "default"
  # using default here is acceptable
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module
  )}"
*/

  s3_bucket_name = module.standard_bucket.id
}

