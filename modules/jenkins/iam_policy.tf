data "aws_iam_policy_document" "jenkins" {
  statement {
    sid    = "AttachEBS"
    effect = "Allow"

    actions = [
      "ec2:AttachVolume",
      "ec2:DescribeVolumes",
      "ec2:DescribeImages",
    ]

    resources = [
      "*",
    ]
  }
}

data "aws_iam_policy_document" "jenkins_assume_roles" {
  statement {
    sid    = "AssumeRoles"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::${var.aws_account_ids[0]}:role/jenkins-admin",
      "arn:aws:iam::${var.aws_account_ids[1]}:role/jenkins-admin",
      "arn:aws:iam::${var.aws_account_ids[2]}:role/jenkins-admin",
    ]
  }
}

resource "aws_iam_policy" "jenkins_assume_roles" {
  name        = "${var.project}-${var.environment}-${var.component}-jenkins-assume"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-jenkins-assume"
  policy      = data.aws_iam_policy_document.jenkins_assume_roles.json
}


resource "aws_iam_policy" "jenkins" {
  name        = "${var.project}-${var.environment}-${var.component}-jenkins"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-jenkins"
  policy      = data.aws_iam_policy_document.jenkins.json
}

resource "aws_iam_role_policy_attachment" "jenkins-xacct" {
  role       = module.jenkins_blue.iam_role_name
  policy_arn = aws_iam_policy.jenkins_assume_roles.arn
}

resource "aws_iam_role_policy_attachment" "jenkins" {
  role       = module.jenkins_blue.iam_role_name
  policy_arn = aws_iam_policy.jenkins.arn
}

