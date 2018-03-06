variable "project" {
  type        = "string"
  description = ""
}

variable "environment" {
  type        = "string"
  description = ""
}

variable "component" {
  type        = "string"
  description = ""
}

variable "module" {
  type        = "string"
  description = ""
  default     = "lambda"
}

variable "name" {
  type        = "string"
  description = ""
}

variable "s3_bucket" {
  type        = "string"
  description = ""
}

variable "s3_key" {
  type        = "string"
  description = ""
}

variable "runtime" {
  type        = "string"
  description = ""
}

variable "handler" {
  type        = "string"
  description = ""
}

variable "memory_size" {
  type        = "string"
  description = ""
}

variable "timeout" {
  type        = "string"
  description = ""
}

variable "publish" {
  type        = "string"
  description = ""
}

variable "env_variables" {
  type        = "map"
  description = ""
  default     = {}
}

variable "principal_service" {
  type        = "string"
  description = "A service name allowed to invoke lambda. Accepted values: apigateway, events"
  default     = ""
}

variable "invoker_source_arn" {
  type        = "string"
  description = "The arn of the Principal Service"
  default     = ""
}

variable "cwlg_retention_in_days" {
  type        = "string"
  description = ""
}

variable "default_tags" {
  type        = "map"
  description = ""
  default     = {}
}
