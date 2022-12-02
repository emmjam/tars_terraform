variable "project" {
  type        = string
  description = "The name of the project."
}

variable "environment" {
  type        = string
  description = "The name of the environment."
}

variable "component" {
  type        = string
  description = "The name of the component."
}

variable "table_name" {
  type        = string
  description = "Name of dynamodb table"
}

variable "read_capacity" {
  type        = string
  description = "Read capacity of dynamodb"
}

variable "write_capacity" {
  type        = string
  description = "Write capacity of dynamodb"
}

variable "billing_mode" {
  type        = string
  description = "Billing mode type"
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  type        = string
  description = "Hash key for dynamodb"
}

variable "range_key" {
  type        = string
  description = "Range key for dynamodb"
}

variable "sns_topic_arns" {
  type        = list(any)
  description = "SNS topic arn for subscription"
}

variable "default_tags" {
  type        = map(any)
  description = "Map of default tags to apply to all taggable resources within the module"
}

variable "aws_account_id" {
  type        = string
  description = "The AWS Account ID (numeric)"
}

variable "name" {
  type        = string
  description = "A unique name to distinguish this module invocation from others within the     same CSI scope"
}

variable "module" {
  type        = string
  description = "The name of this module. Should only be set here"
  default     = "lambda-bounced-email-report"
}

variable "bounced_email_s3_bucket" {
  type        = string
  description = "S3 bucket that the bounced email Lambda code is stored in"
}

variable "bounced_email_report_s3_key" {
  type        = string
  description = "S3 key that the bounced email report Lambda code is stored in"
}

variable "bounced_email_notifications_s3_key" {
  type        = string
  description = "S3 key that the bounced email nofifications Lambda code is stored in"
}

variable "enable_bounced_email" {
  type        = string
  description = "whether to enable module or not"
  # default = "0"
}

variable "ses_report_lambda_env_vars" {
  type        = map
  description = "Lambda environment parameters map"
  default     = {}
}

variable "bounced_email_domain" {
  type        = string
  description = "bounced email domain"
}
