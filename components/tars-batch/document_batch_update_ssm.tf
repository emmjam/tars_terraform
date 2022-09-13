resource "aws_ssm_parameter" "dbu_maxrecordsprocessed" {
  name        = "/${var.environment}/tars/batch/DocumentBatchUpdate-MaxRecordsProcessed"
  description = "DocumentBatchUpdate - Maximum records processed in the Job Polling"
  type        = "String"
  value       = var.dbu_maxrecordsprocessed

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/DocumentBatchUpdate-MaxRecordsProcessed"
    },
  )
}

resource "aws_ssm_parameter" "dg_maxbatchrecords" {
  name  = "/${var.environment}/tars/batch/DocumentGeneration-maxbatchrecords"
  type  = "String"
  value = var.document_generation_maxbatchrecords

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/DocumentGeneration-MaxBatchRecords"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_minAgeHours" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-challengedCardAuth-minAgeHours"
  type  = "String"
  value = var.puca_job_cca_minAgeHours

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-challengedCardAuth-minAgeHours"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_maxAgeDays" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-challengedCardAuth-maxAgeDays"
  type  = "String"
  value = var.puca_job_cca_maxAgeDays

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-challengedCardAuth-maxAgeDays"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_maxProcessed" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-challengedCardAuth-maxProcessed"
  type  = "String"
  value = var.puca_job_cca_maxProcessed

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-challengedCardAuth-maxProcessed"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_communicationError_minAgeHours" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-communicationError-minAgeHours"
  type  = "String"
  value = var.puca_job_cca_communicationError_minAgeHours

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-communicationError-minAgeHours"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_communicationError_maxAgeDays" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-communicationError-maxAgeDays"
  type  = "String"
  value = var.puca_job_cca_communicationError_maxAgeDays

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-communicationError-maxAgeDays"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_communicationError_maxProcessed" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-communicationError-maxProcessed"
  type  = "String"
  value = var.puca_job_cca_communicationError_maxProcessed

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-communicationError-maxProcessed"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_nonfinalepdqstatus_minAgeHours" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-nonFinalEPDQStatus-minAgeHours"
  type  = "String"
  value = var.puca_job_cca_nonfinalepdqstatus_minAgeHours

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-nonFinalEPDQStatusr-minAgeHours"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_nonfinalepdqstatus_maxAgeDays" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-nonFinalEPDQStatus-maxAgeDays"
  type  = "String"
  value = var.puca_job_cca_nonfinalepdqstatus_maxAgeDays

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-nonFinalEPDQStatus-maxAgeDays"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_nonfinalepdqstatus_maxProcessed" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-nonFinalEPDQStatus-maxProcessed"
  type  = "String"
  value = var.puca_job_cca_nonfinalepdqstatus_maxProcessed

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-nonFinalEPDQStatus-maxProcessed"
    },
  )
}

resource "aws_ssm_parameter" "puca_job_cca_maxRecordsPerJobRun" {
  name  = "/${var.environment}/tars/batch/ProcessUnknownCardAuthorisationsJob-maxRecordsPerJobRun"
  type  = "String"
  value = var.puca_job_cca_maxRecordsPerJobRun

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ProcessUnknownCardAuthorisationsJob-maxRecordsPerJobRun"
    },
  )
}

resource "aws_ssm_parameter" "transfer_theory_test_extract_file_to_fttsjob_directory" {
  count = var.transfer_theory_test_extract_file_to_ftts_job_directory == "" ? "0" : "1"
  name  = "/${var.environment}/tars/batch/TransferTheoryTestExtractFileToFTTSJob-directory"
  type  = "String"
  value = var.transfer_theory_test_extract_file_to_ftts_job_directory

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/transfer-theory-testextractfiletofttsjob-directory"
    },
  )
}

resource "aws_ssm_parameter" "passwordreset_resetcode_codetimeout" {
  name  = "/${var.environment}/tars/all/PasswordReset-resetCode-codeTimeout"
  type  = "String"
  value = var.passwordreset_resetcode_codetimeout

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/PasswordReset-resetCode-codeTimeout"
    },
  )
}

resource "aws_ssm_parameter" "passwordreset_resetcode_requesttimelimit" {
  name  = "/${var.environment}/tars/all/PasswordReset-resetCode-requestTimeLimit"
  type  = "String"
  value = var.passwordreset_resetcode_requesttimelimit

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/PasswordReset-resetCode-requestTimeLimit"
    },
  )
}