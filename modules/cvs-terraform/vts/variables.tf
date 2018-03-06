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
  default     = "vts"
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

## vts
variable "vts_s3_key" {
  type        = "string"
  description = ""
}

variable "vts_memory_size" {
  type        = "string"
  description = ""
}

variable "vts_timeout" {
  type        = "string"
  description = ""
}

variable "vts_publish" {
  type        = "string"
  description = ""
}

variable "vts_cwlg_retention_in_days" {
  type        = "string"
  description = ""
}

variable "vts_env_vars" {
  type        = "map"
  description = ""
  default     = {}
}

variable "authorizer_id" {
  type        = "string"
  description = "The authorizer id to be used."
}
