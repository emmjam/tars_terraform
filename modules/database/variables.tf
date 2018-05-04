variable "availability_zones" {
  type        = "list"
  description = "List of availability zones"
}

variable "environment" {
  type        = "string"
  description = "Environment Name"
}

variable "module" {
  type        = "string"
  description = "Moudle Name"
  default     = "database"
}

variable "project" {
  type        = "string"
  description = "Project Name"
}

variable "vpc_id" {
  type        = "string"
  description = "Parent VPC ID"
}

variable "zone_id" {
  type        = "string"
  description = "VPC Zone ID for R53 DNS "
}

variable "rds_engine_version" {
  type        = "string"
  description = "DB Engine version to use"
}

variable "rds_backup_retention_period" {
  type        = "string"
  description = "Days to retain backups for"
}

variable "rds_multi_az" {
  type        = "string"
  description = "Use Multi AZ RDS"
}

variable "rds_storage_type" {
  type        = "string"
  description = "RDS Priamry Data storage Type"
}

variable "rds_backup_window" {
  type        = "string"
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
}

variable "rds_engine" {
  type        = "string"
  description = "RDS Db Engine to use"
}

variable "rds_skip_final_snapshot" {
  type        = "string"
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
}

variable "rds_allocated_storage" {
  type        = "string"
  description = "RDS Allocated Storage in GB"
}

variable "rds_db_pg_id" {
  type        = "string"
  description = "RDS Parameter Group ID"
  default     = ""
}

variable "rds_db_og_id" {
  type        = "string"
  description = "RDS Option Group ID"
  default     = ""
}

variable "rds_password" {
  type        = "string"
  description = "RDS Master password"
}

variable "rds_instance_class" {
  type        = "string"
  description = "RDS Instance Class"
}

variable "rds_db_name" {
  type        = "string"
  description = "RDS Database Name"
}

variable "rds_username" {
  type        = "string"
  description = "RDS Username"
}

variable "rds_maintenance_window" {
  type        = "string"
  description = "The window to perform maintenance in"
}

variable "additional_sg_ids" {
  type        = "list"
  description = "additional sg ids to attach to DB isntance"
  default     = []
}

variable "name" {
  type        = "string"
  description = "Microservice name. Used to define resource names and Name tags"
}

variable "default_tags" {
  type        = "map"
  description = "Default tags to apply to all taggable resources"
}

variable "subnets_cidrs" {
  type        = "list"
  description = "A list of cidr blocks for subnets to launch RDS instance in."
}

variable "subnets_route_tables" {
  type        = "list"
  description = "List of Route table IDs to associate with the subnets"
}

variable "component" {
  type        = "string"
  description = "The variable encapsulating the name of this component"
}

variable "s3_bucketlogs_bucket_id" {
  type        = "string"
  description = "The name (id) of the S3 bucket used for S3 Bucket Access Logging within the scope of the parent component or module"
}

variable "aws_account_id" {
  type        = "string"
  description = "The ID of the AWS Account. Used in S3 bucket naming"
}

variable "public" {
  type = "string"
}

variable "license_model" {
  type = "string"
}

