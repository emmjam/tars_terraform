//Creates KMS for Backup
resource "aws_kms_key" "tars_efs" {
  description             = "KMS tars_efs Backup"
  deletion_window_in_days = 10
}

//Creates Vault for Backup
resource "aws_backup_vault" "tars_efs" {
  name        = "tars_efs"
  kms_key_arn = aws_kms_key.tars_efs.arn
}

//Creats Backup Plan and schedule
resource "aws_backup_plan" "tars_efs" {
  name = "tars_backup_plan"

  rule {
    rule_name         = "tars_efs_backup_rule"
    target_vault_name = aws_backup_vault.tars_efs.name
    schedule          = "cron(0 03 * * ? *)"
    lifecycle {
      delete_after = 30
    }
  }
}

// Create IAM Role for backup

resource "aws_iam_role" "tars_aws_backup" {
  name               = "tars_aws_backup"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY

}

resource "aws_iam_role_policy_attachment" "tars_aws_backup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.tars_aws_backup.name
}

