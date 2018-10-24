# This could be an epic mistake, but for now the decision
# is not to include the CSI in ECR repository names
# as they are special, as if they were gitlab repos
# just hosted by Amazon. Each thing exists only once
# in the multiverse, so it unique by its own name,
# not as an aspect of its deployment.

resource "aws_ecr_repository" "tars_puppet" {
  name = "tars/puppet"
}
