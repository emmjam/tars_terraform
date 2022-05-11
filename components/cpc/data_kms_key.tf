# vorontsovc
# used by rds for encryption
data "aws_kms_key" "env_by_alias" {
  key_id = "alias/${join("-", [var.project, var.environment])}-key"
}