# The ID of the AWS Config Configuration Recorder
output "configuration_recorder_id" {
  value = "${aws_config_configuration_recorder.main.id}"
}

# The ID of the AWS Config Delivery Channel
output "delivery_channel_id" {
  value = "${aws_config_delivery_channel.main.id}"
}

# The Name of the S3 Bucket delivered to by the Delivery Channel
output "bucket_name" {
  value = "${module.standard_bucket.id}"
}
