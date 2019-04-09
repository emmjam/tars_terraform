resource "aws_iam_group" "capita_perf_ro_users" {
  count = "${length(var.capita_perf_ro_users) == 0 ? 0 : 1}"
  name  = "CapitaPerfROUsers"
  path  = "/"
}

resource "aws_iam_group" "support_ro_users" {
  count = "${length(var.support_ro_users) == 0 ? 0 : 1}"
  name  = "SupportROUsers"
  path  = "/"
}

resource "aws_iam_group" "tss_billing_ro_users" {
  count = "${length(var.tss_billing_ro_users) == 0 ? 0 : 1}"
  name  = "TSSBillingROUsers"
  path  = "/"
}

resource "aws_iam_group" "db_cw_ro_users" {
  count = "${length(var.db_cw_ro_users) == 0 ? 0 : 1}"
  name  = "DBCWROUsers"
  path  = "/"
}