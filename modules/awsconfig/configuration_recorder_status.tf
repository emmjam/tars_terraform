# The AWS Config Recorder Status.
# This sets the status of the AWS Config Recorder, but depends upon
# the existence of an AWS Config Delivery Channel for the recorder.
# For this reason, the explicit depends_on statement is required in
# order to avoid a race condition on creation.
resource "aws_config_configuration_recorder_status" "main" {
  name = "${aws_config_configuration_recorder.main.name}"

  depends_on = [
    "aws_config_delivery_channel.main",
  ]

  is_enabled = "true"
}
