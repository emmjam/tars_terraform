# This could be an epic mistake, but for now the decision
# is not to include the CSI in ECR repository names
# as they are special, as if they were gitlab repos
# just hosted by Amazon. Each thing exists only once
# in the multiverse, so it unique by its own name,
# not as an aspect of its deployment.

resource "aws_ecr_repository" "jenkins" {
  name = "tars/run/jenkinsci"
}

resource "aws_ecr_repository" "tars_run_mock" {
  name = "tars/run/mock"
}

resource "aws_ecr_repository" "tars_build_puppet" {
  name = "tars/build/puppet"
}

resource "aws_ecr_repository" "tars_build_tars-core" {
  name = "tars/build/tars-core"
}

resource "aws_ecr_repository" "tars_build_cpc" {
  name = "tars/build/cpc"
}

resource "aws_ecr_repository" "tars_build_obs" {
  name = "tars/build/obs"
}

resource "aws_ecr_repository" "tars_build_ibs" {
  name = "tars/build/ibs"
}

resource "aws_ecr_repository" "tars_build_fyndi" {
  name = "tars/build/fyndi"
}

resource "aws_ecr_repository" "tars_build_repackage" {
  name = "tars/build/repackage"
}

resource "aws_ecr_repository" "mot2_build_centos_puppet" {
  name = "mot2/build/centos-puppet"
}

resource "aws_ecr_repository" "mot2_build_prometheus" {
  name = "mot2/build/prometheus"
}

resource "aws_ecr_repository" "tars_run_terraform" {
  name = "tars/run/terraform"
}

