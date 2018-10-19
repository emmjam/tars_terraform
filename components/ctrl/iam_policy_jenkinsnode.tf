resource "aws_iam_policy" "jenkinsnode" {
  name        = "${local.csi}-jenkinsnode"
  description = "IAM policy for ${local.csi}-jenkinsnode"
  policy      = "${data.aws_iam_policy_document.jenkinsnode.json}"
}
