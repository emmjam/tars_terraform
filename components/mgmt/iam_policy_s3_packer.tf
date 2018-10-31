resource "aws_iam_policy" "s3-packer" {
  name        = "${local.csi}-s3-packer"
  description = "IAM policy for ${local.csi}-s3-packer"
  policy      = "${data.aws_iam_policy_document.s3-packer.json}"
}
