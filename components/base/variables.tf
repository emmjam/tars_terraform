variable "aws_region" {
  type        = "string"
  description = "AWS Region"
}

variable "project" {
  type        = "string"
  description = "TF Scaffold project"
}

variable "environment" {
  type        = "string"
  description = "TF Scaffold environment"
}

variable "component" {
  type        = "string"
  description = "TF Scaffold component"
  default     = "base"
}

variable "asg_default_tags" {
  type        = "list"
  description = ""
  default     = []
}

variable "default_tags" {
  type        = "map"
  description = "Default tag map"

  default = {
    Component = "base"
  }
}

variable "vpc_cidr" {
  type        = "string"
  description = "VPC CIDR Range"
}

variable "private_domain_name" {
  type        = "string"
  description = "R53 Private Domain Name"
}

variable "tars_backend_subnets_cidrs" {
  type        = "list"
  description = "TARS backend tier subnet CIDR's"
  default     = []
}

variable "tars_backend_elb_subnets_cidrs" {
  type        = "list"
  description = "TARS backend elb tier subnet CIDR's"
  default     = []
}

variable "cpc_backend_alb_subnets_cidrs" {
  type        = "list"
  description = "CPC backend elb tier subnet CIDR's"
  default     = []
}

variable "tars_web_subnets_cidrs" {
  type        = "list"
  description = "TARS web tier subnet CIDR's"
  default     = []
}

variable "tars_messaging_subnets_cidrs" {
  type        = "list"
  description = "TARS messaging tier subnet CIDR's"
  default     = []
}

variable "tars_messaging_alb_subnets_cidrs" {
  type        = "list"
  description = "TARS messaging ALB tier subnet CIDR's"
  default     = []
}

variable "awsmq_subnets_cidrs" {
  type        = "list"
  description = "AWS MQ Subnet CIDR's"
  default     = []
}

variable "tars_alb_internal" {
  type        = "list"
  description = "TARS Internal ALB Subnet CIDR's"
  default     = []
}

variable "obs_alb_internal" {
  type        = "list"
  description = "OBS Internal ALB Subnet CIDR's"
  default     = []
}

variable "cpc_alb_internal" {
  type        = "list"
  description = "CPC Internal ALB Subnet CIDR's"
  default     = []
}

variable "alb_public_subnets_cidrs" {
  type        = "list"
  description = "TARS Public Facing ALB Subnet CIDR's"
  default     = []
}

variable "rds_subnets_cidrs" {
  type        = "list"
  description = "TARS RDS Subnet CIDR's"
  default     = []
}

variable "mis_rds_subnets_cidrs" {
  type        = "list"
  description = "MIS RDS Subnet CIDR's"
  default     = []
}

variable "cpc_rds_subnets_cidrs" {
  type        = "list"
  description = "CPC RDS Subnet CIDR's"
  default     = []
}

variable "fyndi_back_alb_subnets_cidrs" {
  type        = "list"
  description = "FYNDI back ALB  Subnet CIDR's"
  default     = []
}

variable "tars_dvsa_alb_cidrs" {
  type        = "list"
  description = "TARS dvsa public ALB"
  default     = []
}

variable "cpc_sftp_subnets_cidrs" {
  type        = "list"
  description = "CPC SFTPPlus Server CIDRs"
  default     = []
}

variable "elc_main_engine" {
  type        = "string"
  description = "Engine Type for elasticache"
}

variable "elc_main_engine_version" {
  type        = "string"
  description = "Engine Version for elasticache"
}

variable "elc_main_node_type" {
  type        = "string"
  description = "Elasticache Node Type"
}

variable "elc_main_cache_nodes" {
  type        = "string"
  description = "Elasticache node count"
}

variable "elc_main_parameter_group" {
  type        = "string"
  description = "Elasticache Paramter Group"
}

variable "elc_main_port" {
  type        = "string"
  description = "Elasticache Port"
}

variable "elc_main_subnets_cidrs" {
  type        = "list"
  description = "Elasticache Subnets"
  default     = []
}

variable "squidnat_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "squidnat_instance_type" {
  type        = "string"
  description = ""
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
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

variable "transit_peering_enabled" {
  type        = "string"
  description = "Enable Transit VPC peering to West Malling"
  default     = false
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}

## Mgmt

variable "mgmt_component" {
  type        = "string"
  description = ""
}

variable "mgmt_vpc_cidr_block" {
  type        = "string"
  description = "CIDR Block range of MGMT account/comp"
}

variable "mgmt_jenkins_elb_subnet" {
  type        = "string"
  description = "Jenkins Master subnet"
}

variable "mgmt_vpc_id" {
  type        = "string"
  description = "MGMT account vpc cidr"
}

variable "mgmt_gitlab_subnet" {
  type        = "string"
  description = "MGMT gitlab subent cidr"
}

variable "mgmt_aws_region" {
  type        = "string"
  description = ""
}

variable "mgmt_aws_account_id" {
  type        = "string"
  description = ""
}

variable "mgmt_project" {
  type        = "string"
  description = ""
}

variable "mgmt_environment" {
  type        = "string"
  description = ""
}

## Jenkins

variable "jenkinsnode_subnets_cidrs" {
  type        = "list"
  description = "Jenkinsnode subnet CIDR's"
  default     = []
}

variable "jenkins_nat_subnets_cidrs" {
  type        = "list"
  description = "Jenkinsnode NAT subnet CIDR's"
  default     = []
}

variable "jenkinsnode_ami_build_id" {
  type        = "string"
  description = "Jenkinsnode AMI build nomber"
}

variable "jenkinsnode_executors" {
  type        = "string"
  description = "executor count for jenkinsnodes"
}

variable "jenkinsnode_instance_type" {
  type        = "string"
  description = "Jnekins instance size"
}

variable "jenkinsnode_asg_max_size" {
  type        = "string"
  description = ""
}

variable "jenkinsnode_asg_min_size" {
  type        = "string"
  description = ""
}

## JMeter

variable "jmeter_instance_type" {
  type        = "string"
  description = ""
}

variable "jmeter_asg_size_desired_on_create" {
  type        = "string"
  description = ""
}

variable "jmeter_asg_size_max" {
  type        = "string"
  description = ""
}

variable "jmeter_asg_size_min" {
  type        = "string"
  description = ""
}

variable "jmeter_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

## Prometheus

variable "prometheus_cert_name" {
  type        = "string"
  description = ""
}

variable "prometheus_ami_build_id" {
  type        = "string"
  description = ""
}

variable "prometheus_efs_provisioned_mibps" {
   type        = "string"
   description = ""
}

variable "prometheus_instance_type" {
  type        = "string"
  description = ""
}

variable "prometheus_asg_max_size" {
  type        = "string"
  description = ""
}

variable "prometheus_asg_min_size" {
  type        = "string"
  description = ""
}

variable "prometheus_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "prometheus_efs_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "prometheus_alb_private_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "aws_mq_config_description" {
  type        = "string"
  description = "AWS MQ config decsription"
}

variable "aws_mq_config_name" {
  type        = "string"
  description = "AWS MQ config name"
}

variable "aws_mq_config_engine_type" {
  type        = "string"
  description = "AWS MQ config engine type"
}

variable "aws_mq_config_engine_version" {
  type        = "string"
  description = "AWS MQ config engine version"
}

variable "aws_mq_deployment_mode" {
  type        = "string"
  description = "AWS MQ deployment mode"
}

variable "aws_mq_users_tars_batch_user" {
  type        = "string"
  description = "AWS MQ tars batch user"
}

variable "aws_mq_engine_version" {
  type        = "string"
  description = "AWS MQ engine version"
}

variable "aws_mq_users_admin_user" {
  type        = "string"
  description = "AWS MQ admin user"
}

variable "aws_mq_users_admin_group" {
  type        = "string"
  description = "AWS MQ admin group"
}

variable "aws_mq_users_tars_batch_password" {
  type        = "string"
  description = "AWS MQ tars batch user password"
}

variable "aws_mq_users_tars_batch_group" {
  type        = "string"
  description = "AWS MQ tars batch user group"
}

variable "aws_mq_users_tars_messaging_password" {
  type        = "string"
  description = "AWS MQ tars messaging user password"
}

variable "aws_mq_host_instance_type" {
  type        = "string"
  description = "AWS MQ host instance type"
}

variable "aws_mq_users_admin_password" {
  type        = "string"
  description = "AWS MQ users admin password"
}

variable "aws_mq_users_tars_messaging_user" {
  type        = "string"
  description = "AWS MQ user tars messaging"
}

variable "whitelist" {
  type        = "list"
  description = "TARS Servers inbound whitelisted IP's"
  default     = []
}

variable "aws_mq_users_tars_messaging_group" {
  type        = "string"
  description = "AWS MQ group tars messaging"
}

variable "aws_mq_engine_type" {
  type        = "string"
  description = "AWS MQ engine type"
}

variable "aws_mq_users_cpc_back_user" {
  type        = "string"
  description = "AWS MQ user cpc back"
}

variable "aws_mq_users_cpc_back_group" {
  type        = "string"
  description = "AWS MQ group cpc back"
}

variable "aws_mq_users_cpc_back_password" {
  type        = "string"
  description = "AWS MQ cpc back user password"
}

variable "aws_mq_users_cpc_batch_user" {
  type        = "string"
  description = "AWS MQ user cpc batch"
}

variable "aws_mq_users_cpc_batch_group" {
  type        = "string"
  description = "AWS MQ group cpc batch"
}

variable "aws_mq_users_cpc_batch_password" {
  type        = "string"
  description = "AWS MQ cpc batch user password"
}

variable "ad_peering_enabled" {
  type        = "string"
  description = "Peer with DVSA AD or not"
}
variable "ad_account" {
  type        = "string"
  description = "DVSA AD account number"
}

variable "ad_peering_vpc" {
  type        = "string"
  description = "DVSA AD VPC"
}

variable "jmeter_puppet_nodetype" {
  type        = "string"
  description = "JMeter Nodetype for Puppet"
  default     = "jmeter"
}

variable "domain_name_servers" {
  type        = "list"
  description = "DHCP Scope options for DNS Servers"

  default = [
    "AmazonProvidedDNS",
  ]
}

variable "cert_name" {
  type        = "string"
  description = "ACM cert name"
}

variable "efs_backup_instance_type" {
  type        = "string"
  description = ""
}

variable "efs_backup_asg_max_size" {
  type        = "string"
  description = ""
}

variable "efs_backup_asg_min_size" {
  type        = "string"
  description = ""
}

variable "efs_backup_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "efs_backup_ami_build_id" {
  type        = "string"
  description = ""
}

variable "holding_pages_cert" {
  type        = "string"
  description = ""
}

variable "sftpplus_nlb_subnets_cidrs" {
  type        = "list"
  description = "SFTP Plus NLB subnet CIDRs"
  default     = []
}
