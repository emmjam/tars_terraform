variable "project" {
  type        = "string"
  description = "The name of the Project we are bootstrapping terraformscaffold for"
}

variable "aws_account_id" {
  type        = "string"
  description = "The AWS Account ID into which we are bootstrapping terraformscaffold"
}

variable "region" {
  type        = "string"
  description = "The AWS Region into which we are bootstrapping terraformscaffold"
}

variable "environment" {
  type        = "string"
  description = "The name of the environment for the bootstrapping process; which is always bootstrap"
  default     = "bootstrap"
}

variable "component" {
  type        = "string"
  description = "The name of the component for the bootstrapping process; which is always bootstrap"
  default     = "bootstrap"
}

variable "bucket_name" {
  type        = "string"
  description = "The name to use for the terraformscaffold bucket"
}

variable "ro_principals" {
  type        = "list"
  description = "A list of Principals permitted to ListBucket and GetObject for Remote State purposes"

  default = [
    "arn:aws:iam::645711882182:root", # dvsatarsmgmt
    "arn:aws:iam::652856684323:root", # dvsatarsnonprod
  ]
}
