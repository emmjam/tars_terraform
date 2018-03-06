data "aws_iam_policy_document" "gitlab" {
  statement {
    sid    = "AttachEBS"
    effect = "Allow"

    actions = [
      "ec2:AttachVolume",
      "ec2:DescribeVolumes",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "gitlab" {
  name        = "${var.project}-${var.environment}-${var.component}-gitlab"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-gitlab"
  policy      = "${data.aws_iam_policy_document.gitlab.json}"
}

resource "aws_iam_policy_attachment" "gitlab" {
  name       = "${var.project}-${var.environment}-${var.component}-gitlab"
  roles      = ["${module.gitlab.iam_role_name}"]
  policy_arn = "${aws_iam_policy.gitlab.arn}"
}
