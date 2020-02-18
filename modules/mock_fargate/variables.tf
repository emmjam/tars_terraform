##
# Basic inherited variables for terraformscaffold modules
##

variable "region" {
  type        = string
  description = "The region of the terraformscaffold project calling the module"
}

variable "project" {
  type        = string
  description = "The name of the terraformscaffold project calling the module"
}

variable "environment" {
  type        = string
  description = "The name of the terraformscaffold environment the module is called for"
}

variable "component" {
  type        = string
  description = "The name of the terraformscaffold component calling this module"
}

##
# Variable specific to the module
##

variable "module" {
  type        = string
  description = "The name of this module. Should only be set here."
  default     = "microservice"
}

variable "name" {
  type        = string
  description = "Microservice name. Used to define resource names and Name tags"
}

variable "cwl_retention_in_days" {
  type        = string
  description = "Cloudwatch logs log retention period"
  default     = "60"
}

variable "image" {
  type        = string
  description = "image to pass throug hto jenkins worker task"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "lb_private" {
  type        = string
  description = "Private ALB"
}

variable "lb_public" {
  type        = string
  description = "Public ALB"
}

variable "additional_sg_ids" {
  type        = list(string)
  description = "list of extra sg's to add"
  default     = []
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
}

variable "iam_policy_arn" {
  type        = string
  description = "Policy arn for jenkins workers to execute with, typical administrator"
}

variable "default_tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all taggable resources"
}

