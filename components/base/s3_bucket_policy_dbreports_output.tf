resource "aws_s3_bucket_policy" "dbreports_output" {
  bucket = "${aws_s3_bucket.dbreports_output.id}"
  policy = "${data.aws_iam_policy_document.dbreports_output.json}"
}