data "aws_iam_policy_document" "sonarqube" {
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

resource "aws_iam_policy" "sonarqube" {
  name        = "${var.project}-${var.environment}-${var.component}-sonarqube"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-sonarqube"
  policy      = "${data.aws_iam_policy_document.sonarqube.json}"
}

resource "aws_iam_policy_attachment" "sonarqube" {
  name       = "${var.project}-${var.environment}-${var.component}-sonarqube"
  roles      = ["${module.microservice_sonarqube.iam_role_name}"]
  policy_arn = "${aws_iam_policy.sonarqube.arn}"
}
