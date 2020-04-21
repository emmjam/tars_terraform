resource "aws_iam_role" "ibs_rds_role" {
  name = "${local.csi}-ibs-role"
  assume_role_policy = data.aws_iam_policy_document.rds_assumerole.json
}

resource "aws_iam_policy" "ibs_rds_policy" {
  name = "${local.csi}-ibs-policy"
  policy = data.aws_iam_policy_document.aurora_rds_cloudwatch_logs.json
}

resource "aws_iam_policy_attachment" "ibs-attach-ibs-to-cloudwatch" {
  name       = "${local.csi}-ibs-policy-attachment"
  roles      = [ "${aws_iam_role.ibs_rds_role.name}" ]
  policy_arn = aws_iam_policy.ibs_rds_policy.arn
}
