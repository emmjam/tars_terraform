# TODO: peacheym: This approach is insecure
#
# Trust policy to grant assumerole access
# to a specific User in a DVSA auditing account
data "aws_iam_policy_document" "DVSA-EC2-Read-Role" {
  statement {
    sid    = "TrustDVSAAuditUserCLIReadOnly01"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::233824316563:user/CLI-ReadOnly01",
      ]
    }
  }
}
