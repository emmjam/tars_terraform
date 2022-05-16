resource "aws_kms_grant" "autoscaling_grant_access" {
  count = contains(["live","nonprod","mgmt"],var.environment) ? 1 : 0
  name              = "platform-ops-grant-access-autoscaling"
  key_id            = aws_kms_key.main[0].arn
  grantee_principal = "arn:aws:iam::${var.aws_account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling" 
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom","GenerateDataKey","GenerateDataKeyWithoutPlaintext","DescribeKey","CreateGrant"]
}
