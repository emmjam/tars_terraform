resource "aws_s3_bucket_policy" "reporting_xe_s3_access_logs" {
  count = var.reporting_xe_count
  bucket = module.access_logs_bucket[count.index].id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowELBLogging",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::156460612806:root"
        },
        "Action" : "s3:PutObject",
        "Resource" : "${module.access_logs_bucket[count.index].arn}/*"
      }
    ]
  })
}
