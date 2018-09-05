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

variable "whitelist" {
  type        = "list"
  description = ""
  default     = []
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

variable "jenkinsnode_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "gitlab_subnets_cidrs" {
  type        = "list"
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

variable "gitlab_db_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "gitlab_redis_subnets_cidrs" {
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

variable "deployer_pub_key" {
  type        = "string"
  description = "Pub SSH ky for deployer"
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

#### Gitlab

variable "gitlab_ami_build_id" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_allocated_storage" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_backup_retention_period" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_backup_window" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_db_name" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_engine_version" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_instance_class" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_maintenance_window" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_multi_az" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_password" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_pg_family" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_skip_final_snapshot" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_storage_type" {
  type = "string"
  description = ""
  
}
variable "gitlab_db_username" {
  type = "string"
  description = ""
  
}
variable "gitlab_ebs_volume_size" {
  type = "string"
  description = ""
  
}
variable "gitlab_ebs_volume_type" {
  type = "string"
  description = ""
  
}
variable "gitlab_elb_public_public_port" {
  type = "string"
  description = ""
  
}
variable "gitlab_elb_public_public_protocol" {
  type = "string"
  description = ""
  
}
variable "gitlab_instance_type" {
  type = "string"
  description = ""
  
}
variable "gitlab_redis_endpoint_address" {
  type = "string"
  description = ""
  
}
variable "gitlab_redis_engine_version" {
  type = "string"
  description = ""
  
}
variable "gitlab_redis_maintenance_window" {
  type = "string"
  description = ""
  
}
variable "gitlab_redis_node_type" {
  type = "string"
  description = ""
  
}
variable "gitlab_redis_parameter_group_name" {
  type = "string"
  description = ""
  
}
variable "gitlab_redis_snapshot_retention_limit" {
  type = "string"
  description = ""
  
}
variable "gitlab_redis_snapshot_window" {
  type = "string"
  description = ""
  
}

## Jenkins

variable "jenkins_asg_max_size" {
  type = "string"
  description = ""
  
}
variable "jenkins_asg_min_size" {
  type = "string"
  description = ""
  
}
variable "jenkins_ami_build_id" {
  type = "string"
  description = ""
}
variable "jenkins_blue_nodes_number" {
  type = "string"
  description = ""
  
}
variable "jenkins_ebs_volume_size" {
  type = "string"
  description = ""
}
variable "jenkins_ebs_volume_type" {
  type = "string"
  description = ""
}
variable "jenkins_instance_type" {
  type = "string"
  description = ""
}
variable "jenkins_scaledown_desired" {
  type = "string"
  description = ""
}
variable "jenkins_scaledown_recurrence" {
  type = "string"
  description = ""
}
variable "jenkins_scaleup_desired" {
  type = "string"
  description = ""
}
variable "jenkins_scaleup_recurrence" {
  type = "string"
  description = ""
}
variable "mgmt_vpc_id" {
  type = "string"
  description = ""
}

variable "prod_public_domain_name" {
  type        = "string"
  description = "The fully-qualified domain name for the Prod Public Hosted Zone, if undefined, no zone will be created"
  default     = ""
}

variable "prod_subdomains_name_servers" {
  type        = "map"
  description = "Map of accounts with NS records in a form: '<record_name> = <comma seperated list of NS addresses>'"
  default     = {}
}
