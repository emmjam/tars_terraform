## general
variable "project" {
  type        = string
  description = "Terraform Scaffold project"
}

variable "region" {
  type = string
}

variable "environment" {
  type        = string
  description = "Terraform Scaffold environment"
}

variable "component" {
  type        = string
  description = "Terraform Scaffold component"
}

variable "module" {
  type        = string
  description = "The static name identifier for this module. Do not override in the module call"
  default     = "sonarqube"
}

variable "default_tags" {
  type        = map(string)
  description = "The map of default tags to apply to all taggable resources in the module alongside resource-specific tags"
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "routing_table" {
  type        = list(string)
  description = "Routing table SonarQube Web and DB subnets should be associated with"
}

variable "aws_availability_zones" {
  type        = list(string)
  description = "A list of AZs to launch resources in."
}

variable "vpc_domain_name" {
  type        = string
  description = ""
}

variable "aws_account_id" {
  type        = string
  description = "AWS ACcount ID"
}

variable "kms_key" {
  type        = string
  description = "KMS Key id"
}

variable "route53_zone" {
  type        = string
  description = "Route 53 zone to use for domain"
}

## sonar microservice
variable "sq_asg_size_desired" {
  type        = string
  description = "The number of Amazon EC2 instances that should be running in the group."
}

variable "asg_default_tags" {
  type        = list(object({
    key = string
    value = string
    propagate_at_launch = string
  }))
  description = ""
  default     = []
}

variable "sq_asg_size_max" {
  type        = string
  description = "The maximum size of the auto scale group."
}

variable "sq_asg_size_min" {
  type        = string
  description = "The minimum size of the auto scale group."
}

variable "sq_ami_id" {
  type        = string
  description = "The EC2 image ID to launch."
}

variable "sq_instance_type" {
  type        = string
  description = "The size of instance to launch."
}

variable "sq_subnets_cidrs" {
  type        = list(string)
  description = "A list of cidr blocks for subnets to launch EC2 instance in."
}

variable "lc_additional_sg_ids" {
  type    = list(string)
  default = []
}

variable "ebs_volume_size" {
  type = string
}

variable "ebs_volume_type" {
  type    = string
  default = "gp2"
}

## rds
variable "rds_subnets_cidrs" {
  type        = list(string)
  description = "A list of cidr blocks for subnets to launch RDS instance in."
}

variable "rds_pg_max_allowed_packet" {
  type        = string
  description = "The max_allowed_packet variable value specified in bytes."
}

variable "rds_pg_family" {
  type        = string
  description = "The family of the DB parameter group."
}

variable "rds_db_name" {
  type        = string
  description = "The DB name to create."
  default     = "sonar"
}

variable "rds_allocated_storage" {
  type        = string
  description = "The allocated storage in gigabytes."
}

variable "rds_storage_type" {
  type        = string
  description = "The storage type."
}

variable "rds_engine" {
  type        = string
  description = "The database engine to use."
}

variable "rds_engine_version" {
  type        = string
  description = "The engine version to use."
}

variable "rds_instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
}

variable "rds_multi_az" {
  type        = string
  description = "Specifies if the RDS instance is multi-AZ."
}

variable "rds_username" {
  type        = string
  description = "Username for the master DB user."
}

variable "rds_password" {
  type        = string
  description = "Password for the master DB user."
}

variable "rds_skip_final_snapshot" {
  type        = string
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
}

variable "rds_backup_retention_period" {
  type        = string
  description = "The days to retain backups for."
}

variable "rds_backup_window" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
}

variable "rds_maintenance_window" {
  type        = string
  description = "The window to perform maintenance in."
}
