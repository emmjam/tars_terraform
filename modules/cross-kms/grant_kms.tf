resource "aws_kms_grant" "autoscaling_grant_access" {
  count = contains(["prod","nonprod"],var.environment) ? 1 : 0
  name              = "platform-ops-grant-access-autoscaling"
  key_id            = "arn:aws:kms:eu-west-1:645711882182:key/a32e7e37-ff98-4904-bc14-a1d3256755c8"
  grantee_principal = "arn:aws:iam::${var.aws_account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling" 
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom","GenerateDataKey","GenerateDataKeyWithoutPlaintext","DescribeKey","CreateGrant"]
}
