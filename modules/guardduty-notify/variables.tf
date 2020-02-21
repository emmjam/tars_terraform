# GENERAL
variable "project" {
  type        = "string"
  description = "The project name"
}

variable "environment" {
  type        = "string"
  description = "The environment name"
}

variable "component" {
  type        = "string"
  description = "The TF component name"
}

variable "module" {
  type        = "string"
  description = "The module name"
  default     = "guardduty-notify"
}

variable "default_tags" {
  type        = "map"
  description = "Default tags to be applied to all taggable resources"
  default     = {}
}

# SPECIFIC
variable "lambda_guardduty_slack_s3_key" {
  type        = "string"
  description = "Path to the guardduty slack lambda"
}

# SNS Guardduty to OpsGenie
variable "opsgenie_sns_topic_sub_create" {
  type        = "string"
  description = "SNS topic for Ops Genie"
  default     = false
}

variable "opsgenie_sns_topic_sub_protocol" {
  type        = "string"
  description = "SNS topic protocol for OpsGenie"
}

variable "opsgenie_sns_topic_sub_endpoint" {
  type        = "string"
  description = "SNS topic endpoint for OpsGenie"
}

variable "lambda_platform_bucket" {
  type        = "string"
  description = "S3 bucket location for platform lambdas"
}

variable "cwlg_retention_in_days" {
  type        = "string"
  description = "Retention period for CW logs in days"
}

variable "encrypted_webhook_url" {
  type        = "string"
  description = "KMS encrypted value of the Slack webhook url"
}

variable "runtime" {
  type        = "string"
  description = "The runtime environment for the Lambda function you are uploading"
}

variable "handler" {
  type        = "string"
  description = "The function entrypoint in your code."
}

variable "memory_size" {
  type        = "string"
  description = "Amount of memory in MB your Lambda Function can use at runtime. "
}

variable "name" {
  type        = "string"
  description = "Name of the Lambda Function"
}

variable "timeout" {
  type        = "string"
  description = "The amount of time your Lambda Function has to run in seconds."
}

variable "platform_ops_kms_user_policy_arn" {
  type        = "string"
  description = "ARN of the KMS key used for platform/job specific tasks"
}
