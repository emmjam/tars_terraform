resource "aws_dlm_lifecycle_policy" "ibs_dlm" {
  count              = contains(var.ebs_backup_env, var.environment) ? 1 : 0
  description        = "${var.environment}-${var.component}-DLM lifecycle policy"
  execution_role_arn = data.terraform_remote_state.acc.outputs.tars_dlm_lifecycle_role_arn
  state              = var.dlm_state

  policy_details {
    resource_types = ["INSTANCE"]

    schedule {
      name = "${var.component}-${var.environment}-daily snapshots"

      create_rule {
        interval      = var.dlm_interval
        interval_unit = "HOURS"
        times         = [var.dlm_time]
      }

      retain_rule {
        count = var.dlm_retain_rule
      }

      tags_to_add = {
        SnapshotCreator = "DLM-${var.component}-${var.environment}"
      }

      copy_tags = true
    }

    target_tags = {
      Name = "tars-${var.environment}-${var.component}/ibs"
    }
  }
}
