data "aws_iam_policy_document" "rsis_tif_access" {
  statement {
    sid    = "AllowDVSATifAccess"
    effect = "Allow"

    actions = [
      "s3:ListObjects",
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::tars-246976497890-eu-west-1-prod-tars-batch-rsistiffbucket",
      "arn:aws:s3:::tars-246976497890-eu-west-1-prod-tars-batch-rsistiffbucket/*",
      "arn:aws:s3:::tars-246976497890-eu-west-1-prod-tars-batch-rsistiffbucket2",
      "arn:aws:s3:::tars-246976497890-eu-west-1-prod-tars-batch-rsistiffbucket2/*",
      "arn:aws:s3:::tars-246976497890-eu-west-1-prod-base-rsistiffbucket",
      "arn:aws:s3:::tars-246976497890-eu-west-1-prod-base-rsistiffbucket/*",
      "arn:aws:s3:::tars-246976497890-eu-west-1-prod-base-rsistiffbucket2",
      "arn:aws:s3:::tars-246976497890-eu-west-1-prod-base-rsistiffbucket2/*"
    ]
  }
}
