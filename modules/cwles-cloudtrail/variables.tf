variable "project" {
  type        = string
  description = "The name of the terraformscaffold project"
}

variable "environment" {
  type        = string
  description = "The name of the terraformscaffold environment"
}

variable "component" {
  type        = string
  description = "The name of the terraformscaffold component"
}

variable "module" {
  type        = string
  description = "The name of this module. This is a special variable that should only be set here."
  default     = "cwles-cloudtrail"
}

variable "default_tags" {
  type        = map(string)
  description = "The map of default tags to apply to all taggable resources within the module"
  default     = {}
}

variable "aws_account_id" {
  type = string
}

variable "s3_bucketlogs_bucket_id" {
  type        = string
  description = "The name (id) of the S3 bucket used for S3 Bucket Access Logging within the scope of the parent component or module"
}

variable "custom_metrics" {
  type        = list(object({
    name = string
    filter = string
  }))
  description = "A list of maps containing, name, filter and alarm_description for CloudTrail custom metrics - pushing a metric value of 1 when the log filter is met"
  default     = []
}

variable "cloudwatch_metric_alarm_actions" {
  type        = list(string)
  description = "A list of actions (e.g. SNS topic ARNs) to use as targets for cloudwatch metrics alarms raised in this module"
  default     = []
}

