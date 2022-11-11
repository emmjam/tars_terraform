output "mis-db-sg-id" {
  value = aws_security_group.tars-mis-db.id
}

output "rsis-db-sg-id" {
  value = aws_security_group.tars-rsis-db.id
}

## Output the SES user secrets

output "secret" {
  value     = var.ses_user_access_key == true ? aws_iam_access_key.ses_user[0].secret : null
  sensitive = true
}

output "user" {
  value = var.ses_user_access_key == true ? aws_iam_access_key.ses_user[0].user : null
}

output "access_key" {
  value = var.ses_user_access_key == true ? aws_iam_access_key.ses_user[0].id : null
}

output "ses_smtp_password_v4" {
  value     = var.ses_user_access_key == true ? aws_iam_access_key.ses_user[0].ses_smtp_password_v4 : null
  sensitive = true
}