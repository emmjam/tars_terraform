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
  description = ""
  default     = "tars"
}

variable "default_tags" {
  type        = "map"
  description = ""

  default = {
    Component = "tars"
  }
}

variable "tars_core_whitelist" {
  type        = "list"
  description = ""
  default     = []
}

variable "wildfly-back" {
  type        = "map"
  description = ""
}

variable "wildfly-front" {
  type        = "map"
  description = ""
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "private_domain_name" {
  type        = "string"
  description = ""
}

variable "backend_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "tars_rds_allocated_storage" {
  type        = "string"
  description = ""
}

variable "tars_rds_storage_type" {
  type        = "string"
  description = ""
}

variable "tars_rds_engine" {
  type        = "string"
  description = ""
}

variable "tars_rds_engine_version" {
  type        = "string"
  description = ""
}

variable "tars_rds_instance_class" {
  type        = "string"
  description = ""
}

variable "tars_rds_port" {
  type        = "string"
  description = ""
}

variable "tars_rds_public" {
  type        = "string"
  description = ""
}

variable "tars_rds_multi_az" {
  type        = "string"
  description = ""
}

variable "tars_rds_backup_retention" {
  type        = "string"
  description = ""
}

variable "tars_rds_backup_window" {
  type        = "string"
  description = ""
}

variable "tars_rds_maint_window" {
  type        = "string"
  description = ""
}

variable "tars_rds_skip_final_snapshot" {
  type        = "string"
  description = ""
}

variable "tars_rds_password" {
  type        = "string"
  description = ""
}

variable "tars_rds_username" {
  type        = "string"
  description = ""
}

variable "tars_rds_apply_immediately" {
  type        = "string"
  description = ""
  default = "false"
}

variable "tars_rds_license_model" {
  type        = "string"
  description = ""
}

variable "tars_rds_snapshot" {
  type        = "string"
  description = ""
}

variable "asg_termination_policies" {
  type        = "list"
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"
  default     = ["OldestInstance", "OldestLaunchConfiguration", "ClosestToNextInstanceHour"]
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

variable "mgmt_bastion_subnets" {
  type        = "list"
  description = ""
  default     = []
}

variable "ami_build_id" {
  type        = "string"
  description = ""
}
# variable "api_gateway_dns_alias" {
#   type        = "string"
#   description = ""
#   default     = ""
# }

# variable "public_domain_name" {
#   type        = "string"
#   description = ""
#   default     = ""
# }

# variable "acm_cert_prefix" {
#   type        = "string"
#   description = ""
#   default     = "*"
# }

# variable "vts_s3_bucket" {
#   type        = "map"
#   description = ""
#   default     = {}
# }

# variable "vts_s3_key" {
#   type        = "string"
#   description = ""
# }

# variable "vts" {
#   type        = "map"
#   description = ""
#   default     = {}
# }

# variable "vts_env_vars" {
#   type        = "map"
#   description = ""
#   default     = {}
# }

# variable "vts_auth_env_vars" {
#   type        = "map"
#   description = ""
#   default     = {}
# }

# variable "vts_authorizer_id" {
#   type        = "string"
#   description = "The authorizer id to be used."
# }
