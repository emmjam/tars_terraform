# All the standard S3 Bucket outputs except
# the website specific ones that we as a module
# do not provide or support

output "id" {
  value = aws_s3_bucket.standard.id
}

output "arn" {
  value = aws_s3_bucket.standard.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.standard.bucket_domain_name
}

output "hosted_zone_id" {
  value = aws_s3_bucket.standard.hosted_zone_id
}

output "region" {
  value = aws_s3_bucket.standard.region
}

