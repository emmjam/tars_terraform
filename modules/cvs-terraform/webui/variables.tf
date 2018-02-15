variable "aws_region" {
  type        = "string"
  description = ""
}

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
  default     = "cvs-webui"
}

variable "default_tags" {
  type        = "map"
  description = ""
  default     = {}
}

variable "api_gateway_dns_alias" {
  type        = "string"
  description = ""
}

variable "public_domain_name" {
  type        = "string"
  description = ""
  default     = ""
}

variable "acm_cert_prefix" {
  type        = "string"
  description = ""
}

variable "bucket_prefix" {
  type        = "string"
  description = ""
}

variable "bucket_versioning_enabled" {
  type        = "string"
  description = ""
  default     = false
}

variable "bucket_force_destroy" {
  type        = "string"
  description = ""
  default     = true
}

variable "atf_account_view_s3_key" {
  type        = "string"
  description = ""
}

## atf_account_view
variable "atf_account_view_memory_size" {
  type        = "string"
  description = ""
}

variable "atf_account_view_timeout" {
  type        = "string"
  description = ""
}

variable "atf_account_view_publish" {
  type        = "string"
  description = ""
}

variable "atf_account_view_cwlg_retention_in_days" {
  type        = "string"
  description = ""
}

variable "atf_account_view_env_vars" {
  type        = "map"
  description = ""
  default     = {}
}

variable "atf_account_view_app_secret" {
  type        = "string"
  description = ""
}
