resource "aws_elasticsearch_domain_policy" "es" {
  domain_name     = aws_elasticsearch_domain.es.domain_name
  access_policies = data.aws_iam_policy_document.es_acl.json
}

