##
# terraformscaffold variables
##

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

##
# Variables specific to this module
##

variable "vpc_id" {
  type        = string
  description = "The VPC ID of the VPC requiring a cwles flow log"
}

