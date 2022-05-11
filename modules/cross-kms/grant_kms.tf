resource "aws_iam_role" "autoscaling_grant_access" {
  name = "platform-ops-grant-access-autoscaling"
  assume_role_policy = data.aws_iam_policy_document.grant_policy.json
}

resource "aws_kms_grant" "autoscaling_grant_access" {
  name              = "platform-ops-grant-access-autoscaling"
  key_id            = aws_kms_key.main.key_id
  grantee_principal = "arn:aws:iam::645711882182:role/platform-ops-grant-access-autoscaling"
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom","GenerateDataKey","GenerateDataKeyWithoutPlaintext","DescribeKey","CreateGrant"]
}
