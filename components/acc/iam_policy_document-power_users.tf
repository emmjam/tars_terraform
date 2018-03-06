# TODO: this is just a temporary policy
data "aws_iam_policy_document" "power_users" {
  statement {
    sid    = "AllowAllServerless"
    effect = "Allow"

    actions = [
      "iam:*",
      "lambda:*",
      "states:*",
      "s3:*",
      "sqs:*",
      "dynamodb:*",
      "apigateway:*",
      "execute-api:*",
      "cloudwatch:*",
      "events:*",
      "logs:*",
      "application-autoscaling:*",
      "cognito-identity:*",
      "cognito-idp:*",
      "cognito-sync:*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "DenyAllTFandTrailBuckets"
    effect = "Deny"

    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${var.tf_state_bucket_prefix}-${data.aws_caller_identity.current.account_id}-${var.aws_region}*",
      "arn:aws:s3:::cvs-${var.environment}-acc-trail-temp*",
    ]
  }

  statement {
    sid    = "DenyIAMUsersGroupsModifications"
    effect = "Deny"

    actions = [
      "iam:AddUserToGroup",
      "iam:CreateUser",
      "iam:DeleteGroup",
      "iam:DeleteGroupPolicy",
      "iam:DeleteUser",
      "iam:DeleteUserPolicy",
      "iam:DetachGroupPolicy",
      "iam:DetachUserPolicy",
      "iam:RemoveUserFromGroup",
      "iam:UpdateGroup",
    ]

    resources = [
      "*",
    ]
  }
}
