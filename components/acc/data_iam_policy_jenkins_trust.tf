data "aws_iam_policy_document" "jenkins_trust" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::645711882182:root",
      ]
    }

  }
}
