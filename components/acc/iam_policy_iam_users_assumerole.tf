# A trust policy to allow all users to assume a role to which this policy
# is attached, so long as they are also granted the permission to assume
# the role via the policies attached to them or groups they belong to.
data "aws_iam_policy_document" "iam_users_assumerole" {
  statement {
    sid    = "TrustIAMUsersToAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "${format(
          "%s:%s:%s",
          "arn:aws:iam:",
          data.aws_caller_identity.current.account_id,
          "root"
        )}",
      ]
    }
  }
}