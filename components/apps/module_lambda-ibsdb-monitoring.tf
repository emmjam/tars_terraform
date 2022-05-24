module "lambda_ibsdb_monitoring" {
  source = "../../modules/lambda-vpc"

  name        = "ibsdb-monitoring"
  project     = var.project
  environment = var.environment
  component   = var.component

  s3_bucket = "tars-645711882182-eu-west-1-mgmt-mgmt-artefacts"

  s3_key = "release-candidates/lambdas/ibsdb-monitoring/ibsdb-monitoring-2020-07-15-15-08.zip"

  runtime     = "python3.8"
  handler     = "function.lambda_handler"
  memory_size = "128"
  timeout     = "10"

  vpc_id                     = data.terraform_remote_state.base.outputs.vpc_id
  subnet_ids                 = module.ibs.subnet_ids
  additional_security_groups = [data.terraform_remote_state.base.outputs.core_sg_id]

  principal_service  = "events"
  invoker_source_arn = aws_cloudwatch_event_rule.ibsdb_monitoring.arn

  env_variables = {
    ENVIRONMENT        = var.environment
    MYSQL_HOST         = aws_rds_cluster.ibsdb_cluster.reader_endpoint
    MYSQL_DB_NAME      = "ibsappdb"
    MYSQL_USERNAME_KEY = "ibsdb/ibsappuser/username"
    MYSQL_PASSWORD_KEY = "ibsdb/ibsappuser/password"
  }

  cwlg_retention_in_days = "7"

  default_tags = local.default_tags
}

resource "aws_security_group_rule" "aurora_db_ingress_ibsdb_monitoring" {
  description              = "Allow TCP/3306 from IBS"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ibs_aurora.id
  source_security_group_id = module.lambda_ibsdb_monitoring.security_group_id
}

resource "aws_security_group_rule" "ibsdb_monitoring_egress_aurora" {
  description              = "Allow TCP/3306 To Aurora"
  type                     = "egress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.lambda_ibsdb_monitoring.security_group_id
  source_security_group_id = aws_security_group.ibs_aurora.id
}

data "aws_iam_policy_document" "ibsdb_monitoring" {
  statement {
    sid    = "GetIBSDBCredentials"
    effect = "Allow"

    actions = [
      "ssm:GetParameter",
    ]

    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/ibsdb/ibsappuser/*",
    ]
  }

  statement {
    sid    = "PushCWData"
    effect = "Allow"

    actions = [
      "cloudwatch:PutMetricData",
    ]

    resources = [
      "*",
    ]
  }

}

resource "aws_iam_policy" "ibsdb_monitoring" {
  name        = "${local.csi}-ibsdb-monitoring"
  description = "IAM policy for ${local.csi}-ibsdb_monitoring"
  policy      = data.aws_iam_policy_document.ibsdb_monitoring.json
}

resource "aws_iam_policy_attachment" "ibsdb_monitoring" {
  name       = "${local.csi}-ibsdb-monitoring"
  roles      = [module.lambda_ibsdb_monitoring.role_name]
  policy_arn = aws_iam_policy.ibsdb_monitoring.arn
}

