resource "aws_kms_grant" "autoscaling_grant_access" {
  count             = contains(["live", "nonprod"], var.environment) ? 1 : 0
  name              = "platform-ops-grant-access-autoscaling"
  key_id            = "arn:aws:kms:eu-west-1:645711882182:key/303c3787-4bb4-4c17-a9d7-7870544b1d46"
  grantee_principal = "arn:aws:iam::${var.aws_account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom", "GenerateDataKey", "GenerateDataKeyWithoutPlaintext", "DescribeKey", "CreateGrant"]
}

resource "aws_kms_grant" "autoscaling_grant_access_mgmt" {
  count             = contains(["mgmt"], var.environment) ? 1 : 0
  name              = "platform-ops-grant-access-autoscaling-mgmt"
  key_id            = "arn:aws:kms:eu-west-1:645711882182:key/303c3787-4bb4-4c17-a9d7-7870544b1d46"
  grantee_principal = "arn:aws:iam::${var.aws_account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom", "GenerateDataKey", "GenerateDataKeyWithoutPlaintext", "DescribeKey", "CreateGrant", "ReEncryptTo"]
}
