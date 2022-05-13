resource "aws_ssm_parameter" "dbu_maxrecordsprocessed" {
  name        = "/${var.environment}/tars/batch/DocumentBatchUpdate-MaxRecordsProcessed"
  description = "DocumentBatchUpdate - Maximum records processed in the Job Polling"
  type        = "SecureString"
  value       = var.dbu_maxrecordsprocessed

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/DocumentBatchUpdate-MaxRecordsProcessed"
    },
  )
}
