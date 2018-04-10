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
  default     = "mgmt"
}

variable "default_tags" {
  type        = "map"
  description = ""

  default = {
    Component = "mgmt"
  }
}

variable "mgmt" {
  type       = "map"
}

variable "account_environment" {
  type = "string"
  description = "Test shortname of current AWS account"
}

variable "aws_account_id" {
  type = "string"
  description = "AWS Account ID of current account"
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = ""
}

variable "users" {
  type        = "list"
  description = "List of IAM Users"
  default     = []
}

variable "administrators" {
  type        = "list"
  description = "List of IAM Users from the 'users' list with Admin rights"
  default     = []
}

variable "vpc_cidr" {
  type        = "string"
  description = ""
}

variable "private_domain_name" {
  type        = "string"
  description = ""
}

variable "nat_subnets_cidr" {
  type        = "string"
  description = ""
}

variable "jenkins_whitelist" {
  type        = "list"
  description = ""
  default     = []
}

variable "jenkins" {
  type        = "map"
  description = ""
}

variable "jenkins_blue_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "jenkins_blue_version" {
  type        = "string"
  description = ""
}

variable "jenkins_green_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "jenkins_green_version" {
  type        = "string"
  description = ""
  default     = "latest"
}

variable "jenkins_elb_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "jenkinsnode" {
  type        = "map"
  description = ""
}

variable "jenkinsnode_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "gitlab" {
  type        = "map"
  description = ""
}

variable "gitlab_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "gitlab_elb_public" {
  type        = "map"
  description = ""
}

variable "gitlab_elb_private_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "gitlab_elb_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "gitlab_db" {
  type        = "map"
  description = ""
}

variable "gitlab_db_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "gitlab_redis" {
  type        = "map"
  description = ""
}

variable "gitlab_redis_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "gitlab_whitelist" {
  type        = "list"
  description = ""
}

variable "alb_public_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "ctrl_peers" {
  type        = "list"
  description = ""
  default     = []
}

variable "ebs_snapshot" {
  type        = "map"
  description = "Map of variables for configuring the EBS snapshot Lambda and associated resources."
  default     = {}
}

variable "ebs_snapshot_cleanup" {
  type        = "map"
  description = "Map of variables for configuring the EBS snapshot cleanup Lambda and associated resources."
  default     = {}
}

variable "deployer_pub_key" {
  type        = "string"
  description = "Pub SSH ky for deployer"
}

variable "dev01_peers" {
  type        = "list"
  description = ""
  default     = []
}

variable "opsdev_peers" {
  type        = "list"
  description = ""
  default     = []
}

variable "sit01_peers" {
  type        = "list"
  description = ""
  default     = []
}

variable "uat01_peers" {
  type        = "list"
  description = ""
  default     = []
}

variable "ctrl_peers_xacct" {
  type = "list"
  description = ""
}
variable "ctrl_peers_local" {
  type = "list"
  description = ""
}
variable "base_peers_xacct" {
  type = "list"
  description = ""
}

variable "base_peers_local" {
  type = "list"
  description = ""
}


