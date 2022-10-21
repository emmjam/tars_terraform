variable "project" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "The project name"
}

variable "component" {
  type        = string
  description = "The component name"
}

variable "module" {
  type        = string
  description = "This module name"
  default     = "microservice"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to apply to all taggable resources"
  default     = {}
}

variable "asg_health_check_grace_period" {
  type        = string
  description = "Time (in seconds) after instance comes into service before checking health"
  default     = "300"
}

variable "asg_health_check_type" {
  type        = string
  description = "'EC2' or 'ELB'. Controls how health checking is done"
  default     = "EC2"
}

variable "asg_size_desired_on_create" {
  type        = string
  description = "The desired size of the ASG *ON CREATION ONLY*"
}

variable "asg_size_max" {
  type        = string
  description = "The maximum size of the autoscaling group"
  default     = "1"
}

variable "asg_size_min" {
  type        = string
  description = "The minimum size of the autoscaling group"
  default     = "0"
}

variable "asg_termination_policies" {
  type        = list(string)
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"
  default     = ["OldestInstance", "OldestLaunchConfiguration", "ClosestToNextInstanceHour"]
}

variable "asg_load_balancers" {
  type        = list(string)
  description = "A list of load balancer names to add to the autoscaling group names"
  default     = []
}

variable "asg_target_group_arns" {
  type        = list(string)
  description = "A list of target groups to add to the autoscaling group"
  default     = []
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones for Subnets and Autoscaling Groups"
  default     = []
}

variable "lc_additional_sg_ids" {
  type        = list(string)
  description = "Additional security groups to assign to ASG instances on top of the unique one created by this module"
  default     = []
}

variable "lc_spot_price" {
  type        = string
  description = "The price to use for reserving spot instances"
  default     = ""
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
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "lc_user_data" {
  type        = string
  description = "User data to feed to the launch configuration"
  default     = ""
}

variable "lc_ebs_size" {
  type        = string
  description = "Size of the EBS volume for microservice instance on creation"
  default     = "16"
}

variable "lc_volume_type" {
  type        = string
  description = "Volume type gp2 gp3"
  default     = "gp3"
}

variable "name" {
  type        = string
  description = "Microservice name. Used to define resource names and Name tags"
}

variable "subnets_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for microservice subnets"
  default     = []
}

variable "subnets_map_public_ip_on_launch" {
  type        = string
  description = "Specify true to indicate that instances should be assigned a public IP address"
  default     = false
}

variable "subnets_route_tables" {
  type        = list(string)
  description = "List of Route table IDs to associate with the subnets"
  default     = []
}

variable "asg_default_tags" {
  type        = map(string)
  description = "Default tag map"

  default = {
    Component = "cpc"
  }
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
