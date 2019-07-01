resource "aws_s3_bucket_policy" "yum" {
  bucket = "${aws_s3_bucket.yum.id}"
  policy = "${data.aws_iam_policy_document.s3_yum.json}"
}