variable "aws_region" {
  type        = "string"
  description = "eu-west-1"
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
  description = "TF Scaffold component"
  default     = "tars-core"
}

variable "release_version" {
  type        = "string"
  default     = "Not provided"
  description = "Version of infrastructure deployed"
}

variable "aws_autoscaling_enabled" {
  type        = "string"
  default     = "1"
  description = "Enable or not the built in AWS autocaling scaling group scheduled actions"  
}

variable "spot_pricing" {
  type        = "map"
  description = "A map containing the the spot instance price (USD) for each instance type"
  default     = {}
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

variable "default_tags" {
  type        = "map"
  description = "Defautl tags to use"

  default = {
    Component = "tars-core"
  }
}

variable "whitelist" {
  type        = "list"
  description = "TARS Core Servers inbound whitelisted IPs"
  default     = []
}

variable "payments_whitelist" {
  type        = "list"
  description = "Payments Backend service whitelist"
  default     = []
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "private_domain_name" {
  type        = "string"
  description = "R53 private domain for TARS"
}

variable "private_cert_domain_name" {
  type        = "string"
  description = "R53 private domain for TARS"
}

variable "tars_rds_allocated_storage" {
  type        = "string"
  description = "TARS RDS DB Allocated Storage"
}

variable "tars_rds_storage_type" {
  type        = "string"
  description = "TARS RDS DB Storage Type"
}

variable "tars_rds_engine" {
  type        = "string"
  description = "TARS RDS DB Engine"
}

variable "tars_rds_engine_version" {
  type        = "string"
  description = "TARS RDS DB Engine Version"
}

variable "tars_rds_instance_class" {
  type        = "string"
  description = "TARS RDS DB Instance Class"
}

variable "tars_rds_port" {
  type        = "string"
  description = "TARS RDS DB Port"
}

variable "tars_rds_public" {
  type        = "string"
  description = "Is TARS RDS DB Publically Accessible"
}

variable "tars_rds_multi_az" {
  type        = "string"
  description = "TARS DB Multi AZ"
}

variable "tars_rds_backup_retention" {
  type        = "string"
  description = "TARS RDS Backup Rentention"
}

variable "tars_rds_backup_window" {
  type        = "string"
  description = "TARS RDS Backup Window"
}

variable "tars_rds_maint_window" {
  type        = "string"
  description = "TARS RDS Maintenance Window"
}

variable "tars_rds_skip_final_snapshot" {
  type        = "string"
  description = "TARS RDS Final Snapshot required"
}

variable "tars_rds_password" {
  type        = "string"
  description = "TARS RDS Password"
}

variable "tars_rds_username" {
  type        = "string"
  description = "TARS RDS Username"
}

variable "tars_rds_apply_immediately" {
  type        = "string"
  description = "TARS RDS Apply changes immediately"
  default     = "false"
}

variable "tars_rds_license_model" {
  type        = "string"
  description = "TARS RDS License Model"
}

variable "tars_rds_snapshot" {
  type        = "string"
  description = "TARS RDS Snapshot to use to restore data"
}

variable "tars_rds_autoscale" {
  type        = "string"
  description = "Auto shutdown/restart RDS Instances tag"
}

variable "tars_rds_sid_name" {
  type        = "string"
  description = "Oracle SID name"
}

variable "tars_rds_delete_protect" {
  type        = "string"
  description = "RDS Deletion Protection"
}
variable "rds_subnets_cidrs" {
  type        = "list"
  description = "TARS RDS Subnet CIDR's"
  default     = []
}

variable "asg_termination_policies" {
  type        = "list"
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"

  default = [
    "OldestInstance",
    "OldestLaunchConfiguration",
    "ClosestToNextInstanceHour",
  ]
}

variable "asg_enabled_metrics" {
  type        = "list"
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
  type        = "list"
  description = "See code comments"
  default     = []
}

variable "lc_spot_price" {
  type        = "string"
  description = "The price to use for reserving spot instances"
  default     = ""
}

variable "lc_key_name" {
  type        = "string"
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "ami_build_id" {
  type        = "string"
  description = "TARS Core AMI build ID"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}

variable "mgmt_aws_account_id" {
  type        = "string"
  description = ""
}

variable "wildfly-back_asg_max_size" {
  type        = "string"
  description = ""
}

variable "wildfly-back_asg_min_size" {
  type        = "string"
  description = ""
}

variable "wildfly-back_scaledown_desired" {
  type        = "string"
  description = ""
}

variable "wildfly-back_scaleup_desired" {
  type        = "string"
  description = ""
}

variable "wildfly-back_scaledown_recurrence" {
  type        = "string"
  description = ""
}

variable "wildfly-back_scaleup_recurrence" {
  type        = "string"
  description = ""
}

variable "wildfly-back_instance_type" {
  type        = "string"
  description = ""
}

variable "wildfly-back_puppet_nodetype" {
  type        = "string"
  description = ""
}

variable "wildfly-front_asg_max_size" {
  type        = "string"
  description = ""
}

variable "wildfly-front_asg_min_size" {
  type        = "string"
  description = ""
}

variable "wildfly-front_scaledown_desired" {
  type        = "string"
  description = ""
}

variable "wildfly-front_scaleup_desired" {
  type        = "string"
  description = ""
}

variable "wildfly-front_scaledown_recurrence" {
  type        = "string"
  description = ""
}

variable "wildfly-front_scaleup_recurrence" {
  type        = "string"
  description = ""
}

variable "wildfly-front_instance_type" {
  type        = "string"
  description = ""
}

variable "wildfly-front_puppet_nodetype" {
  type        = "string"
  description = ""
}

variable "cert_name" {
  type        = "string"
  description = "ACM cert name"
}

variable "rhel_spot_pricing" {
  type        = "map"
  description = "A map containing the the spot instance price (USD) for each instance type"
  default     = {}
}

variable "payments_cert_name" {
  type        = "string"
  description = "ACM cert name"
}

variable "irdt_cert" {
  type        = "string"
  description = "ACM cert name"
}

variable "tars_cert" {
  type        = "string"
  description = "CPC ACM cert name"
}

variable "tars_private_cert" {
  type        = "string"
  description = "TARS Private ACM cert name"
}

variable "apache_asg_max_size" {
  type        = "string"
  description = ""
}

variable "apache_asg_min_size" {
  type        = "string"
  description = ""
}

variable "apache_scaledown_desired" {
  type        = "string"
  description = ""
}

variable "apache_scaleup_desired" {
  type        = "string"
  description = ""
}

variable "apache_scaledown_recurrence" {
  type        = "string"
  description = ""
}

variable "apache_scaleup_recurrence" {
  type        = "string"
  description = ""
}

variable "apache_instance_type" {
  type        = "string"
  description = ""
}

variable "apache_ami_build_id" {
  type        = "string"
  description = ""
}

variable "apache_cert" {
  type        = "string"
  description = ""
}

variable "apache_subnet_cidrs" {
  type        = "list"
  description = ""
}

variable "mes_db_cidr_block" {
  type        = "list"
  description = "MES CIDR block for DB SG connection"
  default     = []
}

variable "mes_api_cidr_block" {
  type        = "list"
  description = "MES CIDR block for App SG connection"
  default     = []
}
