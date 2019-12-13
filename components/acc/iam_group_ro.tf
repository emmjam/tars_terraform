resource "aws_iam_group" "support_ro_users" {
  name  = "SupportROUsers"
  path  = "/"
}

resource "aws_iam_group" "tss_billing_ro_users" {
  name  = "TSSBillingROUsers"
  path  = "/"
}

resource "aws_iam_group" "db_cw_ro_users" {
  name  = "DBCWROUsers"
  path  = "/"
}

