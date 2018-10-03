# TODO: adjust permissions based on real usage
data "aws_iam_policy_document" "jenkinsnode" {
  statement {
    sid    = "AllowAccountManagement"
    effect = "Allow"

    actions = [
      "*",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "jenkinsnode" {
  name        = "${var.project}-${var.environment}-${var.component}-jenkinsnode"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-jenkinsnode"
  policy      = "${data.aws_iam_policy_document.jenkinsnode.json}"
}

resource "aws_iam_policy_attachment" "jenkinsnode" {
  name       = "${var.project}-${var.environment}-${var.component}-jenkinsnode"
  roles      = ["${module.jenkinsnode.iam_role_name}"]
  policy_arn = "${aws_iam_policy.jenkinsnode.arn}"
}
