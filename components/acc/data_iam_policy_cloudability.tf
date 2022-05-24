data "aws_iam_policy_document" "cloudability" {
  statement {
    sid    = "VerifyRolePermissions"
    effect = "Allow"

    actions = [
      "iam:SimulatePrincipalPolicy",
    ]

    resources = [
      aws_iam_role.cloudabilityRole.arn
    ]
  }
  statement {
    sid    = "CloudabilityMonitorResourcesPolicy"
    effect = "Allow"

    actions = [
      "cloudwatch:GetMetricStatistics",
      "dynamodb:DescribeTable",
      "dynamodb:ListTables",
      "ec2:DescribeImages",
      "ec2:DescribeInstances",
      "ec2:DescribeRegions",
      "ec2:DescribeReservedInstances",
      "ec2:DescribeReservedInstancesModifications",
      "ec2:DescribeSnapshots",
      "ec2:DescribeVolumes",
      "ec2:GetReservedInstancesExchangeQuote",
      "ecs:DescribeClusters",
      "ecs:DescribeContainerInstances",
      "ecs:ListClusters",
      "ecs:ListContainerInstances",
      "elasticache:DescribeCacheClusters",
      "elasticache:DescribeReservedCacheNodes",
      "elasticache:ListTagsForResource",
      "elasticmapreduce:DescribeCluster",
      "elasticmapreduce:ListClusters",
      "elasticmapreduce:ListInstances",
      "rds:DescribeDBClusters",
      "rds:DescribeDBInstances",
      "rds:DescribeReservedDBInstances",
      "rds:ListTagsForResource",
      "redshift:DescribeClusters",
      "redshift:DescribeReservedNodes",
      "redshift:DescribeTags",
      "savingsplans:DescribeSavingsPlans",
      "ce:GetSavingsPlansPurchaseRecommendation",
    ]
    resources = [
      "*",
    ]
  }
}
