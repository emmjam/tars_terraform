resource "aws_s3_bucket" "dbreports_output" {
  bucket = "${local.csi_global}-dbreports-output"
  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi_global}-dbreports-output"
    )
  )}"

  force_destroy = "false"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Rotate files out to cheaper storage
  # Delete after 2 years
  lifecycle_rule {
    id      = "wholebucket"
    prefix  = "/"
    enabled = "true"

    transition {
      days          = "30"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "60"
      storage_class = "GLACIER"
    }

    expiration {
      days = "1825"
    }

    noncurrent_version_transition {
      days          = "30"
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = "60"
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = "1825"
    }
  }

}

resource "aws_sns_topic" "dbretention" {
  name = "s3-event-notification-dbretention"

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[{
        "Effect": "Allow",
        "Principal": {"AWS":"*"},
        "Action": "SNS:Publish",
        "Resource": "arn:aws:sns:*:*:s3-event-notification-dbretention",
        "Condition":{
            "ArnLike":{"aws:SourceArn":"${aws_s3_bucket.dbreports_output.arn}"}
        }
    }]
}
POLICY
}

resource "aws_s3_bucket_notification" "dbreports_output" {
  bucket = "${aws_s3_bucket.dbreports_output.id}"

  topic {
    topic_arn     = "${aws_sns_topic.dbretention.arn}"
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"
  }
}
