variable "fyndi_incapsula" {
  type = "string"
  description = ""
}
variable "ibs_incapsula" {
  type = "string"
  description = ""
}
variable "obs_incapsula" {
  type = "string"
  description = ""
}
variable "irdt_incapsula" {
  type = "string"
  description = ""
}
variable "aws_region" {
  type        = "string"
  description = "eu-west-1"
}
variable "project" {
  type        = "string"
  description = "TF Scaffold project"
}
variable "environment" {
  type        = "string"
  description = "TF Scaffold environment"
}
variable "component" {
  type        = "string"
  description = "TF Scaffold component"
  default     = "incap"
}
variable "account_component_name" {
  type        = "string"
  description = "The name of the account-level component as used in remote state"
  default     = "acc"
}
variable "account_environment" {
  type        = "string"
  description = "The environment name for the account level scope for the account in which this component is deployed"
}
variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}