##
# terraformscaffold structural variables
##

variable "project" {
  type        = string
  description = "Terraform Scaffold project"
}

variable "environment" {
  type        = string
  description = "Terraform Scaffold environment"
}

variable "component" {
  type        = string
  description = "Terraform Scaffold component"
}

variable "module" {
  type        = string
  description = "The static name identifier for this module. Do not override in the module call"
  default     = "lambda-cron"
}

variable "default_tags" {
  type        = map
  description = "The map of default tags to apply to all taggable resources in the module alongside resource-specific tags"
  default     = {}
}

##
# Variables specific to this module
##

variable "function_name" {
  type        = string
  description = "Base name of this lambda"
}

variable "description" {
  type        = string
  description = "Description of the Lambda"
}

variable "handler" {
  type        = string
  description = "The name of the lambda handler function (passed directly to the Lambda's handler option)"
}

variable "memory" {
  type        = string
  description = "The amount of memory to apply to the created Lambda"
}

variable "s3_bucket_name" {
  type        = string
  description = "The name of the S3 bucket into which to upload the function artefact"
}

variable "s3_bucket_prefix" {
  type        = string
  description = "The optional prefix to use for storing the lambda function artefact in the bucket"
  default     = ""
}

variable "timeout" {
  type        = string
  description = "Timeout in seconds of the lambda function invocation"
}

variable "cwl_retention" {
  type        = string
  description = "The retention period for the CloudwatchLogs events generated by the lambda function"
}

variable "enabled" {
  type        = string
  description = "Whether the lambda function is enabled (though why would it exist if it were not?)"
  default     = "1"
}

variable "runtime" {
  type        = string
  description = "The runtime to use for the lambda function"
}

variable "publish" {
  type        = string
  description = "Whether to publish the deployed lambda function version"
}

variable "s3_key" {
  type        = string
  description = "The file path for the lambda function deployment artefact"
}

variable "schedule" {
  type        = string
  description = "The fully qualified Cloudwatch Events schedule for when to run the lambda function, e.g. rate(1 day) or a cron() expression"
}

variable "iam_policy_document" {
  type        = string
  description = "An IAM Policy Document to grant the lambda function access to the API calls it needs. Should be the 'json' attribute of an aws_iam_policy_document data source"
}

variable "lambda_env_vars" {
  type        = map
  description = "Lambda environment parameters map (merged with a map containing the current region)"
  default     = {}
}

variable "subnet_ids" {
  type        = list
  description = "Subnet IDs for lambdas in VPCs"
  default     = []
}

variable "security_group_ids" {
  type        = list
  description = "Security group IDs for lambdas in VPCs"
  default     = []
}
