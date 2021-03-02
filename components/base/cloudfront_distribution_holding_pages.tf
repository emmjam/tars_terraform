resource "aws_cloudfront_distribution" "holding_pages" {

  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.holding_pages.bucket_regional_domain_name
    origin_id   = "holdingPagesCloudfrontOrigin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.holding_pages.cloudfront_access_identity_path
    }
  }

  aliases = concat(
      [
        "maintenance-${var.environment}.${data.terraform_remote_state.acc.outputs.public_domain_name}",
        "findnearest-${var.environment}.${data.terraform_remote_state.acc.outputs.public_domain_name}",
        "dsa-${var.environment}.${data.terraform_remote_state.acc.outputs.public_domain_name}",
        "driver-practical-${var.environment}.${data.terraform_remote_state.acc.outputs.public_domain_name}",
      ],
      var.holding_pages_domains,
    )

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = [
        "GB",
      ]
    }
  }

  default_cache_behavior {
    allowed_methods = [
      "HEAD",
      "DELETE",
      "POST",
      "GET",
      "OPTIONS",
      "PUT",
      "PATCH",
    ]

    cached_methods = [
      "GET",
      "HEAD",
    ]

    target_origin_id = "holdingPagesCloudfrontOrigin"

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "allow-all"

  }

  #Ensure all urls return the maintenance page
  custom_error_response {
    error_code         = "404"
    response_code      = "200"
    response_page_path = "/index.html"
  }

  price_class = "PriceClass_200"

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.holding_pages.arn
    ssl_support_method  = "sni-only"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

