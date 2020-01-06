data "aws_iam_policy_document" "jenkins_worker_iam" {
  statement {
    sid    = ""
    effect = "Allow"

    actions = [
                "iam:*",
    ]

    resources = [
      "*",
    ]
  }
  

}
