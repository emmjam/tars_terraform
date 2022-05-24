# GENERAL
variable "project" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "The environment name"
}

variable "component" {
  type        = string
  description = "The TF component name"
}

variable "module" {
  type        = string
  description = "The module name"
  default     = "lambda-holding-pages"
}

variable "default_tags" {
  type        = map(any)
  description = "Default tags to be applied to all taggable resources"
  default     = {}
}

# SPECIFIC

variable "runtime" {
  type        = string
  description = "The runtime environment for the Lambda function you are uploading"
}

variable "handler" {
  type        = string
  description = "The function entrypoint in your code."
}

variable "memory_size" {
  type        = string
  description = "Amount of memory in MB your Lambda Function can use at runtime. "
}

variable "name" {
  type        = string
  description = "Name of the Lambda Function"
}

variable "timeout" {
  type        = string
  description = "The amount of time your Lambda Function has to run in seconds."
}

variable "cwlg_retention_in_days" {
  type        = string
  description = "Retention period for CW logs in days"
}
