  locals {
  sq_subnets_cidrs = [
    "${cidrsubnet(var.vpc_cidr, lookup(var.sonarqube, "sq_subnets_newbits"), lookup(var.sonarqube, "sq_subnets_netnum_root"))}",
    ## Only 1 subnet for instance so we can mount ebs volume
 #   "${cidrsubnet(var.vpc_cidr, lookup(var.sonarqube, "sq_subnets_newbits"), lookup(var.sonarqube, "sq_subnets_netnum_root") + 1)}",
 #   "${cidrsubnet(var.vpc_cidr, lookup(var.sonarqube, "sq_subnets_newbits"), lookup(var.sonarqube, "sq_subnets_netnum_root") + 2)}",
  ]

  sqdb_subnets_cidrs = [
    "${cidrsubnet(var.vpc_cidr, lookup(var.sonarqube, "rds_subnets_newbits"), lookup(var.sonarqube, "rds_subnets_netnum_root"))}",
    "${cidrsubnet(var.vpc_cidr, lookup(var.sonarqube, "rds_subnets_newbits"), lookup(var.sonarqube, "rds_subnets_netnum_root") + 1)}",
    "${cidrsubnet(var.vpc_cidr, lookup(var.sonarqube, "rds_subnets_newbits"), lookup(var.sonarqube, "rds_subnets_netnum_root") + 2)}",
  ]

}