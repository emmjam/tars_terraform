variable "project" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "The environment name"
}

variable "component" {
  type        = string
  description = "The component name"
}

variable "module" {
  type        = string
  description = "This module name"
  default     = "gitlab"
}

variable "name" {
  type        = string
  description = "A common name for resources used in this module"
  default     = "gitlab"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to apply to all taggable resources"
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "The VPC id"
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availablity zones for subnets creation"
}

variable "lc_ami_id" {
  type        = string
  description = "The EC2 image ID to launch"
}

variable "lc_instance_type" {
  type        = string
  description = "The size of instance to launch"
}

variable "lc_key_name" {
  type        = string
  description = "The key name that should be used for the Gitalb instance"
  default     = ""
}

variable "lc_additional_sg_ids" {
  type        = list(string)
  description = "A list of additional security groups ids to be attached to launch configurations"
  default     = []
}

variable "gitlab_subnet_cidrs" {
  type        = list(string)
  description = "A list of CIDR blocks used for blue subnets creation"
}

variable "gitlab_private_route_table_ids" {
  type        = list(string)
  description = "A list of private route tables ids for subnets association"
}

variable "gitlab_whitelist" {
  type        = list(string)
  description = ""
}

variable "elb_public_route_table_ids" {
  type        = list(string)
  description = "A list of public route tables ids for subnets association"
}

variable "elb_subnets_cidrs" {
  type        = list(string)
  description = "A list of CIDR blocks used for ELB subnets creation"
}

variable "elb_private_route_table_ids" {
  type        = list(string)
  description = "A list of public route tables ids for subnets association"
}

variable "elb_private_subnets_cidrs" {
  type        = list(string)
  description = "A list of CIDR blocks used for ELB subnets creation"
}

variable "elb_connection_draining" {
  type        = string
  description = "Boolean to enable connection draining"
  default     = true
}

variable "elb_connection_draining_timeout" {
  type        = string
  description = "The time in seconds to allow for connections to drain"
  default     = 30
}

variable "elb_cross_zone_load_balancing" {
  type        = string
  description = "Enable cross-zone load balancing"
  default     = true
}

variable "elb_public_port" {
  type        = string
  description = "The port to listen on for the load balancer"
}

variable "elb_public_protocol" {
  type        = string
  description = "The protocol to listen on. Valid values are HTTP, HTTPS, TCP, or SSL"
}

variable "elb_public_ssl_certificate_id" {
  type        = string
  description = "The port to listen on for the load balancer"
  default     = ""
}

variable "elb_public_external_address" {
  type        = string
  description = "The port to listen on for the load balancer"
  default     = "localhost"
}

variable "elb_healthy_threshold" {
  type        = string
  description = "The number of checks before the instance is declared health"
  default     = 3
}

variable "elb_unhealthy_threshold" {
  type        = string
  description = "The number of checks before the instance is declared unhealthy"
  default     = 2
}

variable "elb_healthcheck_timeout" {
  type        = string
  description = "The length of time before the check times out"
  default     = 10
}

variable "elb_healthcheck_interval" {
  type        = string
  description = "The interval between checks"
  default     = 15
}

variable "ebs_volume_type" {
  type        = string
  description = "The type of EBS volume"
  default     = "gp2"
}

variable "ebs_volume_size" {
  type        = string
  description = "The size of the drive in GiBs"
}

variable "ebs_device_name" {
  type        = string
  description = "The device name under which the EBS volume is attached"
  default     = "/dev/xvdg"
}

variable "hosted_zone_id" {
  type        = string
  description = "The ID of a hosted zone in which the ELB alias record should be created"
}

variable "domain_name" {
  type        = string
  description = "The domain name used for Jenkins instance hostname setup"
}

variable "r53_record_name" {
  type        = string
  description = "The name of the R53 alias record"
  default     = "gitlab"
}

variable "db_subnets_cidrs" {
  type        = list(string)
  description = "A list of cidr blocks for subnets to launch RDS instance in."
}

variable "db_pg_family" {
  type        = string
  description = "The family of the DB parameter group."
}

variable "db_name" {
  type        = string
  description = "The DB name to create."
}

variable "db_allocated_storage" {
  type        = string
  description = "The allocated storage in gigabytes."
}

variable "db_storage_type" {
  type        = string
  description = "The storage type."
}

variable "db_engine_version" {
  type        = string
  description = "The engine version to use."
}

variable "db_instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
}

variable "db_multi_az" {
  type        = string
  description = "Specifies if the RDS instance is multi-AZ."
}

variable "db_username" {
  type        = string
  description = "Username for the master DB user."
}

variable "db_password" {
  type        = string
  description = "Password for the master DB user."
}

variable "db_skip_final_snapshot" {
  type        = string
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
}

variable "db_backup_retention_period" {
  type        = string
  description = "The days to retain backups for."
}

variable "db_backup_window" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
}

variable "db_maintenance_window" {
  type        = string
  description = "The window to perform maintenance in."
}

variable "db_private_route_table_ids" {
  type        = list(string)
  description = ""
}

variable "redis_subnets_cidrs" {
  type        = list(string)
  description = ""
}

variable "redis_private_route_table_ids" {
  type        = list(string)
  description = ""
}

variable "redis_engine_version" {
  type        = string
  description = ""
}

variable "redis_parameter_group_name" {
  type        = string
  description = ""
}

variable "redis_node_type" {
  type        = string
  description = ""
}

variable "redis_maintenance_window" {
  type        = string
  description = ""
}

variable "redis_snapshot_window" {
  type        = string
  description = ""
}

variable "redis_snapshot_retention_limit" {
  type        = string
  description = ""
}

variable "redis_endpoint" {
  type        = string
  description = ""
}
