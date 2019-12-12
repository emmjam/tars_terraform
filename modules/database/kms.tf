resource "aws_kms_key" "db_key" {
  description         = "master encryption key for secrets"
  enable_key_rotation = "true"
}

resource "aws_kms_alias" "secrets" {
  name          = "alias/dbsecrets"
  target_key_id = aws_kms_key.db_key.key_id
}

