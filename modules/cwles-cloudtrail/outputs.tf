output "cloudtrail_id" {
  value = "${aws_cloudtrail.cloudtrail.id}"
}

output "cloudtrail_arn" {
  value = "${aws_cloudtrail.cloudtrail.arn}"
}

output "bucket_name" {
  value = "${module.standard_bucket.id}"
}

output "bucket_arn" {
  value = "${module.standard_bucket.arn}"
}

output "sns_topic_arn" {
  value = "${aws_sns_topic.cloudtrail.arn}"
}

output "sns_topic_name" {
  value = "${aws_sns_topic.cloudtrail.name}"
}
