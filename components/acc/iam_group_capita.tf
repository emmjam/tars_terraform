resource "aws_iam_group" "capita_users" {
  count = "${length(var.capita_users) == 0 ? 0 : 1}"
  name  = "CapitaUsers"
  path  = "/"
}

resource "aws_iam_group" "capita_archive_users" {
  count = "${length(var.capita_archive_users) == 0 ? 0 : 1}"
  name  = "CapitaTapeArchiveUsers"
  path  = "/"
}
