resource "aws_backup_selection" "tars_aws_backup" {
  count        = "${contains(var.efs_backup_env, var.environment) ? 1 : 0}"
  iam_role_arn = "${data.terraform_remote_state.ctrl.tars_aws_backup_iam_role_arn}"
  name         = "${var.environment}_tars_batch_tars_aws_backup"
  plan_id      = "${data.terraform_remote_state.ctrl.tars_aws_backup_iam_tars_efs_id}"


  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Name"
    value = "tars-${var.environment}-tars-batch/batch"
  }

}