# Policy for OOM S3 bucket
data "aws_iam_policy_document" "oom_logs_iam_policy_document" {
  statement {
    sid = "AllowOOMUpload"

    actions = [
      "s3:PutObject",
    ]

    resources = [
      data.terraform_remote_state.acc.outputs.oom-s3-log-bucket,
      "${data.terraform_remote_state.acc.outputs.oom-s3-log-bucket}/*",
    ]
  }
}

resource "aws_iam_policy" "oom_s3_logs" {
  name        = "${local.csi}-oom_s3_logs"
  description = "IAM policy for ${local.csi}-oom_s3_logs"
  policy      = data.aws_iam_policy_document.oom_logs_iam_policy_document.json
}
