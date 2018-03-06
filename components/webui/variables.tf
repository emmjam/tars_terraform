variable "aws_region" {
  type        = "string"
  description = "eu-west-1"
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
  default     = "webui"
}

variable "default_tags" {
  type        = "map"
  description = ""

  default = {
    Component = "webui"
  }
}

variable "api_gateway_dns_alias" {
  type        = "string"
  description = ""
  default     = ""
}

variable "public_domain_name" {
  type        = "string"
  description = ""
  default     = ""
}

variable "acm_cert_prefix" {
  type        = "string"
  description = ""
  default     = "*"
}

variable "s3_bucket" {
  type        = "map"
  description = ""
}

variable "atf_account_view_s3_key" {
  type        = "string"
  description = ""
}

variable "atf_account_view" {
  type        = "map"
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
