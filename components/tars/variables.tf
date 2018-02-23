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
  default     = "tars"
}

variable "default_tags" {
  type        = "map"
  description = ""

  default = {
    Component = "tars"
  }
}



# variable "api_gateway_dns_alias" {
#   type        = "string"
#   description = ""
#   default     = ""
# }

# variable "public_domain_name" {
#   type        = "string"
#   description = ""
#   default     = ""
# }

# variable "acm_cert_prefix" {
#   type        = "string"
#   description = ""
#   default     = "*"
# }

# variable "vts_s3_bucket" {
#   type        = "map"
#   description = ""
#   default     = {}
# }

# variable "vts_s3_key" {
#   type        = "string"
#   description = ""
# }

# variable "vts" {
#   type        = "map"
#   description = ""
#   default     = {}
# }

# variable "vts_env_vars" {
#   type        = "map"
#   description = ""
#   default     = {}
# }

# variable "vts_auth_env_vars" {
#   type        = "map"
#   description = ""
#   default     = {}
# }

# variable "vts_authorizer_id" {
#   type        = "string"
#   description = "The authorizer id to be used."
# }
