variable "aws_region" {
  type        = "string"
  description = ""
}

variable "aws_account_id" {
  type        = "string"
  description = "AWS Region"
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
  default     = "ctrl"
}

variable "version" {
  type        = "string"
  default     = "Not provided"
  description = "Version of infrastructure deployed"
}

variable "default_tags" {
  type        = "map"
  description = ""
  default     = {}
}

variable "asg_default_tags" {
  type        = "list"
  description = "See code comments"
  default     = []
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = ""
}

variable "private_domain_name" {
  type        = "string"
  description = ""
}

variable "ctrl_vpc_cidr" {
  type        = "string"
  description = ""
}

variable "ctrl_nat_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "ctrl_bastion_subnets" {
  type        = "list"
  description = ""
  default     = []
}

variable "whitelist" {
  type        = "list"
  description = ""
  default     = []
}

variable "public_domain_name" {
  type        = "string"
  description = "public domain name for the hosted zone"
}

# This is new. This is to start the long hike to having
# one consistent domain name structure across the project.
# This will be used by the ctrl component initially in order
# to have a private hosted zone local to the VPC that matches
# the appropriate structure. This variable can then be used
# to expand the single structure wider as different components
# become malleable. One day, all groups may share one single
# domain root and make use of it for all domain purposes,
# public *and* private
variable "root_domain_name" {
  type        = "string"
  description = "See code comments in components/ctrl/variables.tf"
}

## Jenkinsctrl

variable "jenkinsctrl_ami_build_id" {
  type        = "string"
  description = ""
}

variable "jenkinsctrl_scaledown_desired" {
  type        = "string"
  description = ""
}

variable "jenkinsctrl_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "jenkinsctrl_scaledown_recurrence" {
  type        = "string"
  description = ""
}

variable "jenkinsctrl_executors" {
  type        = "string"
  description = ""
}

variable "jenkinsctrl_instance_type" {
  type        = "string"
  description = ""
}

variable "jenkinsctrl_asg_min_size" {
  type        = "string"
  description = ""
}

variable "jenkinsctrl_asg_max_size" {
  type        = "string"
  description = ""
}

variable "jenkinsctrl_scaleup_desired" {
  type        = "string"
  description = ""
}

variable "jenkinsctrl_scaleup_recurrence" {
  type        = "string"
  description = ""
}

variable "mgmt_aws_account_id" {
  type        = "string"
  description = ""
}

## Bastion

variable "bastion_scaleup_desired" {
  type        = "string"
  description = ""
}

variable "bastion_scaledown_desired" {
  type        = "string"
  description = ""
}

variable "bastion_scaledown_recurrence" {
  type        = "string"
  description = ""
}

variable "bastion_ami_build_id" {
  type        = "string"
  description = ""
}

variable "bastion_asg_max_size" {
  type        = "string"
  description = ""
}

variable "bastion_instance_type" {
  type        = "string"
  description = ""
}

variable "bastion_asg_min_size" {
  type        = "string"
  description = ""
}

variable "bastion_scaleup_recurrence" {
  type        = "string"
  description = ""
}

variable "bastion_elb_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}


# Grafana

variable "grafana_ami_build_id" {
  type        = "string"
  description = ""
}

variable "grafana_asg_max_size" {
  type        = "string"
  description = ""
}

variable "grafana_instance_type" {
  type        = "string"
  description = ""
}

variable "grafana_asg_min_size" {
  type        = "string"
  description = ""
}

variable "grafana_scaleup_desired" {
  type        = "string"
  description = ""
}

variable "grafana_scaledown_desired" {
  type        = "string"
  description = ""
}

variable "grafana_scaledown_recurrence" {
  type        = "string"
  description = ""
}

variable "grafana_scaleup_recurrence" {
  type        = "string"
  description = ""
}

variable "grafana_alb_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "ctrl_grafana_subnets" {
  type        = "list"
  description = ""
  default     = []
}

variable "grafana_cert_name" {
  type        = "string"
  description = ""
}

variable "cert_name" {
  type        = "string"
  description = "ACM cert name"
}

variable "dvsa_external_mail_domain" {
  type = "string"
  description = "Email from domain used in production, DNS managed externally"
  default = ""
}


variable "dc_gateway_name" {
  type = "string"
  description = "DC Gateway Name"
}

variable "dc_gateway_aws_asn" {
  type = "string"
  description = "DC Gateway ASN"
}

variable "dc_primary_connection_id" {
  type = "string"
  description = "DC Primary Connection ID"
}

variable "dc_vif_primary_name" {
  type = "string"
  description = "DC Gateway VIF Primary Name"
}

variable "dc_vif_primary_vlan" {
  type = "string"
  description = "DC Gateway VIF Primary VLAN"
}

variable "dc_vif_primary_router" {
  type = "string"
  description = "DC VIF Primary customer router"
}

variable "dc_vif_primary_aws_router" {
  type = "string"
  description = "DC VIF Primary AWS router"
}

variable "dc_vif_primary_bgp_auth_key" {
  type = "string"
  description = "BGP Auth Key"
}

variable "dc_secondary_connection_id" {
  type = "string"
  description = "DC Secondary Connection ID"
}

variable "dc_vif_secondary_vlan" {
  type = "string"
  description = "DC VIF Secondary VLAN"
}

variable "dc_vif_secondary_name" {
  type = "string"
  description = "DC VIF Secondary Name"
}

variable "dc_vif_secondary_router" {
  type = "string"
  description = "DC VIF Secondary custome router"
}

variable "dc_vif_secondary_aws_router" {
  type = "string"
  description = "DC VIF Secondary AWS router"
}

variable "dc_vif_secondary_bgp_auth_key" {
  type = "string"
  description = "BGP Auth Key"
}

variable "dc_vif_asn" {
  type = "string"
  description = "DC VIF ASN"
}

