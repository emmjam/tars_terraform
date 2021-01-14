resource "aws_cloudwatch_log_group" "ibs_ibsdb_cluster_audit" {
  name = "/aws/rds/cluster/${var.project}-${var.environment}-ibs-ibsdb-cluster/audit"
  retention_in_days = "60"
}
