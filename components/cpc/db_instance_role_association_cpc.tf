resource "aws_db_instance_role_association" "cpc_db_reports" {
  db_instance_identifier = aws_db_instance.cpcdb.id
  feature_name           = "S3_INTEGRATION"
  role_arn               = data.terraform_remote_state.base.outputs.iam_role_db_reports_arn
}

resource "aws_db_instance_role_association" "cpc_db_reports_encrypted" {
  db_instance_identifier = aws_db_instance.cpcdb_encrypted.id
  feature_name           = "S3_INTEGRATION"
  role_arn               = data.terraform_remote_state.base.outputs.iam_role_db_reports_arn
}

