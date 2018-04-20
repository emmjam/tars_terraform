##
# Variables relating to naming and structure
##

variable "project" {
  type        = "string"
  description = "The name of the project being deployed for"
}

variable "environment" {
  type        = "string"
  description = "The name of the environment being deployed in"
}

variable "component" {
  type        = "string"
  description = "The name of the component calling this module"
}

variable "module" {
  type        = "string"
  description = "The name of this module. Should only be set here."
  default     = "squidnat"
}

variable "default_tags" {
  type        = "map"
  description = "A map of default tags to apply to all taggable resources within the module"
}

##
# Variables relating to function and resource parameters
##

variable "additional_sg_ids" {
  type        = "list"
  description = "Additional security group ids to pass to the squidnat instances"
  default     = []
}

variable "ami_id" {
  type        = "string"
  description = "Squid instance AMI ID"
}

variable "egress_whitelist" {
  type        = "list"
  description = "List of CIDR blocks squidnat nodes may egress to for http and https protocols. Usually fine to default to 0.0.0.0/0"

  default = [
    "0.0.0.0/0",
  ]
}

variable "instance_type" {
  type        = "string"
  description = "Squid node instance size"
}

variable "root_domain_name" {
  type        = "string"
  description = "Root of the domain name"
}

variable "route_table_id" {
  type        = "string"
  description = "The route table to attach to the squid nodes"
}

variable "subnets_cidrs" {
  type        = "list"
  description = "List of CIDR blocks to use for the subnets"
}

variable "vpc_id" {
  type        = "string"
  description = "The ID of the VPC"
}

variable "whitelist_cidrs" {
  type        = "list"
  description = "list of CIDR blocks that are allowed to bypass the squid proxy"
}

variable "zone_id" {
  type        = "string"
  description = "Zone ID for the route53 zone"
}
