output "mis-db-sg-id" {
  value = aws_security_group.tars-mis-db.id
}

output "rsis-db-sg-id" {
  value = aws_security_group.tars-rsis-db.id
}

## Output the SES user secrets

output "secret" {
  value = aws_iam_access_key.ses_user.secret
}

output "user" {
  value = aws_iam_access_key.ses_user.user
}

output "access_key" {
  value = aws_iam_access_key.ses_user.id
}
