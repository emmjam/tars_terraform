variable "project" {
  type        = "string"
  description = "The name of the terraformscaffold project"
}

variable "environment" {
  type        = "string"
  description = "The name of the terraformscaffold environment"
}

variable "component" {
  type        = "string"
  description = "The name of the terraformscaffold component"
}

variable "module" {
  type        = "string"
  description = "The name of this module. This is a special variable that should only be set here."
  default     = "cwles-cloudtrail"
}

variable "default_tags" {
  type        = "map"
  description = "The map of default tags to apply to all taggable resources within the module"
  default     = {}
}

variable "aws_account_id" {
  type = "string"
}

variable "cwles_logstoes_lambda_arn" {
  type        = "string"
  description = "The ARN of the logstoes AWS Lambda Function created by the cwles module"
}

variable "s3_bucketlogs_bucket_id" {
  type        = "string"
  description = "The name (id) of the S3 bucket used for S3 Bucket Access Logging within the scope of the parent component or module"
}
