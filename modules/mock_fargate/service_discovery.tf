resource "aws_service_discovery_private_dns_namespace" "mock" {
  name        = "mock"
  description = "Mock namespace"
  vpc         = var.vpc_id

  tags = var.default_tags
}

resource "aws_service_discovery_service" "epdq" {
  name = "epdq"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.mock.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = var.default_tags
}

resource "aws_service_discovery_service" "epdq_db" {
  name = "epdq-db"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.mock.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = var.default_tags
}

