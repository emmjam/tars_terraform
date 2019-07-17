resource "aws_backup_selection" "tars_aws_backup" {
  count        = "${var.environment == "opsdev" ? 1 : 0}"
  //count        = "${contains(["opsdev", "dev01", "sit01"], "var.environment") ? 1 : 0}" v12 not available
  iam_role_arn = "${data.terraform_remote_state.ctrl.tars_aws_backup_iam_role_arn}"
  name         = "${var.environment}_sftpplus_server_tars_aws_backup"
  plan_id      = "${data.terraform_remote_state.ctrl.tars_aws_backup_iam_tars_efs_id}"


  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Name"
    value = "tars-${var.environment}-sftpplus/efs"
  }

}