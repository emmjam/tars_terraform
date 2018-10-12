# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata_efs_backup" {
  role       = "${module.efs_backup.iam_role_name}"
  policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "efs_backup" {
  role       = "${module.efs_backup.iam_role_name}"
  policy_arn = "${aws_iam_policy.efs_backup.arn}"
}
