resource "aws_iam_role" "Legacy-Tape-Archive-Role" {
  name               = "Legacy-Tape-Archive"
  description        = "Role used to upload and manage pre-AWS TARS Tape archive storage in S3."
  assume_role_policy = "${data.aws_iam_policy_document.legacy-tape-archive-upload.json}"
}
