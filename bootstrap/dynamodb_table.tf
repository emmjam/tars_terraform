resource "aws_dynamodb_table" "lock" {
  name           = var.bucket_name
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name        = "Terraform Scaffold lock table for account ${var.aws_account_id} in region ${var.region}"
    Environment = var.environment
    Project     = var.project
    Component   = var.component
    Account     = var.aws_account_id
  }
}
