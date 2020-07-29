variable "aws_region" {
  type        = string
  description = "eu-west-1"
}

variable "project" {
  type        = string
  description = "TF Scaffold project"
}

variable "environment" {
  type        = string
  description = "TF Scaffold environment"
}

variable "component" {
  type        = string
  description = "TF Scaffold component"
  default     = "mock"
}

variable "mock_image" {
  type        = string
  description = "Mock docker image"
}

variable "release_version" {
  type        = string
  default     = "Not provided"
  description = "Version of infrastructure deployed"
}

variable "jenkinsnode_subnets_cidrs" {
  type        = list
  description = "jenkins cidrs for mock"
  default     = []
}

variable "aws_autoscaling_enabled" {
  type        = string
  default     = "1"
  description = "Enable or not the built in AWS autocaling scaling group scheduled actions"
}

variable "rhel_spot_pricing" {
  type        = map(string)
  description = "A map containing the the spot instance price (USD) for each instance type"
  default     = {}
}

variable "account_component_name" {
  type        = string
  description = "The name of the account-level component as used in remote state"
  default     = "acc"
}

variable "account_environment" {
  type        = string
  description = "The environment name for the account level scope for the account in which this component is deployed"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags"

  default = {
    Component = "mock"
  }
}

variable "tf_state_bucket_prefix" {
  type        = string
  description = "TF State bucket prefix"
}

variable "private_domain_name" {
  type        = string
  description = "TARS VPC private R53 domain name"
}

variable "asg_termination_policies" {
  type        = list(string)
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"

  default = [
    "OldestInstance",
    "OldestLaunchConfiguration",
    "ClosestToNextInstanceHour",
  ]
}

variable "asg_enabled_metrics" {
  type        = list(string)
  description = "A list of metrics to apply to the ASG"

  default = [
    "GroupTerminatingInstances",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupPendingInstances",
    "GroupInServiceInstances",
    "GroupMinSize",
    "GroupTotalInstances",
  ]
}

variable "asg_default_tags" {
  type        = list(object({
    key = string
    value = string
    propagate_at_launch = string
  }))
  description = "See code comments"
  default     = []
}

variable "lc_spot_price" {
  type        = string
  description = "The price to use for reserving spot instances"
  default     = ""
}

variable "lc_key_name" {
  type        = string
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "ami_build_id" {
  type        = string
  description = "TARS mock AMI build ID"
  default = ""
}

variable "aws_account_id" {
  type        = string
  description = "Account ID"
}

variable "mgmt_aws_account_id" {
  type        = string
  description = ""
}

variable "wildfly-mock_asg_max_size" {
  type        = string
  description = ""
}

variable "wildfly-mock_asg_min_size" {
  type        = string
  description = ""
}

variable "wildfly-mock_instance_type" {
  type        = string
  description = ""
}

variable "wildfly-mock_puppet_nodetype" {
  type        = string
  description = ""
}

variable "cert_name" {
  type        = string
  description = "ACM cert name"
}

variable "whitelist" {
  type        = list(string)
  description = ""
  default     = []
}

