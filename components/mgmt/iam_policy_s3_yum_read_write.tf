resource "aws_iam_policy" "s3_yum_read_write" {
  name = "${format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    replace(
      var.environment,
      "_",
      ""
    ),
    var.component,
    "s3",
    "yum",
    "read-write"
  )}"

  path   = "/"
  policy = "${data.aws_iam_policy_document.s3_yum_read_write.json}"
}
