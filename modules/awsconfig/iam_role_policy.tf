# The AWS IAM Policy Object that grants access to the S3 Bucket
# created by this module. This policy will be given to the AWS Config
# role created by this module to allow AWS Config to write to the bucket.
resource "aws_iam_policy" "bucketaccess" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    "bucketaccess"
  )}"

  policy = "${data.aws_iam_policy_document.bucketaccess.json}"
}
