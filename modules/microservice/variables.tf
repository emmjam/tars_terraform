##
# Basic inherited variables for terraformscaffold modules
##

variable "region" {
  type        = string
  description = "The region of the terraformscaffold project calling the module"
}

variable "project" {
  type        = string
  description = "The name of the terraformscaffold project calling the module"
}

variable "environment" {
  type        = string
  description = "The name of the terraformscaffold environment the module is called for"
}

variable "component" {
  type        = string
  description = "The name of the terraformscaffold component calling this module"
}

##
# Variable specific to the module
##

variable "module" {
  type        = string
  description = "The name of this module. Should only be set here."
  default     = "microservice"
}

variable "asg_health_check_grace_period" {
  type        = string
  default     = "300"
  description = "Time (in seconds) after instance comes into service before checking health"
}

variable "asg_health_check_type" {
  type        = string
  default     = "EC2"
  description = "'EC2' or 'ELB'. Controls how health checking is done"
}

# This is NOT set in the ASG properties in terraform, it is set at create-time using a local-exec provisioner.
# This ensures that desired size can be changed by schedules and other automation without terraform
# wishing to change the desired value undesirably on subsequent runs.
variable "asg_size_desired_on_create" {
  type        = string
  description = "The desired size of the ASG *ON CREATION ONLY*"
}

variable "asg_size_max" {
  type        = string
  default     = "1"
  description = "The maximum size of the autoscaling group"
}

variable "asg_size_min" {
  type        = string
  default     = "1"
  description = "The minimum size of the autoscaling group"
}

variable "asg_termination_policies" {
  type        = list(string)
  default     = ["OldestInstance", "OldestLaunchConfiguration", "ClosestToNextInstanceHour"]
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"
}

variable "asg_load_balancers" {
  type        = list(string)
  default     = []
  description = "A list of load balancer names to add to the autoscaling group names"
}

variable "availability_zones" {
  type        = list(string)
  default     = []
  description = "List of Availability Zones for Subnets and Autoscaling Groups"
}

variable "lc_additional_sg_ids" {
  type        = list(string)
  default     = []
  description = "Additional security groups to assign to ASG instances on top of the unique one created by this module"
}

variable "lc_ami_id" {
  type        = string
  description = "The AMI ID to use in the ASG Launch Configuration"
}

variable "lc_instance_type" {
  type        = string
  description = "The microservice EC2 instance type"
}

variable "lc_key_name" {
  type        = string
  default     = ""
  description = "The key name that should be used for the instance"
}

variable "lc_user_data" {
  type        = string
  description = "User data to feed to the launch configuration"
  default     = ""
}

variable "lc_spot_price" {
  type        = string
  description = "If set, enabled ASG spot pricing. Sets the Spot Price to bid for instances with"
  default     = ""
}

variable "lc_ebs_size" {
  type        = string
  description = "Size of the EBS volume for microservice instance on creation"
  default     = "16"
}

variable "lc_ebs_size_tars" {
  type        = string
  description = "Size of the EBS volume for microservice instance on creation"
  default     = "10"
}

variable "lc_volume_type" {
  type        = string
  description = "Volume type gp2 gp3"
  default     = "gp3"
}

variable "lifecycle_hook_launching_default_result" {
  type        = string
  description = "If creating a lifecycle hook for the ASG, what should the default result be"
  default     = "ABANDON" # This default only exists to stop terraform complaining it is unset if no hook is requested
}

variable "lifecycle_hook_launching_enabled" {
  type        = string
  description = "Whether to create an Autoscaling Group Lifecycle Hook for the Instance Launching activity"
  default     = "0" # Do not create unless asked for
}

variable "lifecycle_hook_launching_timeout" {
  type        = string
  description = "If creating a lifecycle hook for the ASG, what should the timeout be before proceeding with the default result"
  default     = "300" # This default only exists to stop terraform complaining it is unset if no hook is requested
}

variable "name" {
  type        = string
  description = "Microservice name. Used to define resource names and Name tags"
}

variable "subnets_cidrs" {
  type        = list(string)
  default     = []
  description = "List of CIDR blocks for microservice subnets"
}

variable "subnets_ids" {
  type        = list(string)
  default     = []
  description = "List of IDs of prexisting subnets for this microservice"
}

variable "subnets_map_public_ip_on_launch" {
  type        = string
  default     = "0"
  description = "Specify true to indicate that instances should be assigned a public IP address"
}

variable "subnets_route_tables" {
  type        = list(string)
  description = "List of Route table IDs to associate with the subnets"
  default     = []
}

# It is 100% acknowledged that this is a horrific awful and horrible
# hack and indefensible duplication. I get it, I really do.
# But until we have some kind of solution for this:
# https://github.com/terraform-providers/terraform-provider-aws/issues/874
# this is the only way I can think of to provide a single source of
# interpolated tag insertion that works for AWS Autoscaling Groups.
# Please don't hurt me.
variable "asg_default_tags" {
  type        = list(object({
    key = string
    value = string
    propagate_at_launch = string
  }))
  description = "See code comments"
}

variable "default_tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all taggable resources"
}

variable "vpc_id" {
  type        = string
  description = "Parent VPC ID"
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

##
# Cloudwatch Logs Groups for EC2 Instance Logs
##

variable "cwl_names" {
  type        = list(string)
  description = "List of log file names to create Cloudwatch Logs Log Groups for for this microservice"
  default     = []
}

variable "cwl_retention_days" {
  type        = string
  description = "Retention period in days for Cloudwatch Logs Log Groups for this microservice"
  default     = "30"
}

# Cloudwatch Event Rule
variable "failed_lifecycle_action_sns_topic" {
  type        = string
  description = "The Amazon Resource Name (ARN) associated of the target."
  default     = ""
}
