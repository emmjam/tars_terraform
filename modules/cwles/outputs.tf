# The Elasticsearch Domain ARN
output "es_domain_arn" {
  value = aws_elasticsearch_domain.es.arn
}

# The Elasticsearch Domain public endpoint
output "es_domain_endpoint" {
  value = aws_elasticsearch_domain.es.endpoint
}

# The Elasticsearch Domain ID (Name)
output "es_domain_id" {
  value = aws_elasticsearch_domain.es.domain_id
}

# The LogsToES Lambda Function ARN (for use in cwles-cloudtrail and cwles-vpcflowlog modules)
output "logstoes_lambda_arn" {
  value = aws_lambda_function.logstoes.arn
}

