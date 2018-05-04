data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_role_for_lambda" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
  )}"

  assume_role_policy = "${data.aws_iam_policy_document.lambda_assume_role.json}"
}

data "aws_iam_policy_document" "lambda_kms_decrypt_db" {
  statement {
    actions = [
      "kms:Decrypt",
    ]

    effect    = "Allow"
    resources = ["${aws_kms_key.db_key.arn}"]
  }
}

resource "aws_iam_policy" "lambda_kms_decrypt_db" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "kms-decrypt",
  )}"

  description = "IAM Policy to allow decryptr using DB Key"
  policy      = "${data.aws_iam_policy_document.lambda_kms_decrypt_db.json}"
}

data "aws_iam_policy_document" "lambda_s3_dbpasswd_read" {
  statement {
    actions = [
      "s3:List*",
      "s3:Get*",
    ]

    effect = "Allow"

    resources = [
      "${module.password_bucket.arn}",
      "${module.password_bucket.arn}/*",
    ]
  }
}

resource "aws_iam_policy" "lambda_s3_dbpasswd_read" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "s3-passwd-read",
  )}"

  description = "IAM Policy to allow read access to S3 bucket with encrypted DB password"

  policy = "${data.aws_iam_policy_document.lambda_s3_dbpasswd_read.json}"
}

data "aws_iam_policy_document" "lambda_rds_passwd_reset" {
  statement {
    actions = [
      "rds:ModifyDBInstance",
    ]

    effect    = "Allow"
    resources = ["${aws_db_instance.database.arn}"]
  }
}

resource "aws_iam_policy" "lambda_rds_passwd_reset" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "rds-passwd-reset",
  )}"

  description = "IAM Policy to allow changing RDS password"

  policy = "${data.aws_iam_policy_document.lambda_rds_passwd_reset.json}"
}

resource "aws_iam_role_policy_attachment" "attach-s3" {
  role       = "${aws_iam_role.iam_role_for_lambda.name}"
  policy_arn = "${aws_iam_policy.lambda_s3_dbpasswd_read.arn}"
}

resource "aws_iam_role_policy_attachment" "attach-rds" {
  role       = "${aws_iam_role.iam_role_for_lambda.name}"
  policy_arn = "${aws_iam_policy.lambda_rds_passwd_reset.arn}"
}

resource "aws_iam_role_policy_attachment" "attach-kms" {
  role       = "${aws_iam_role.iam_role_for_lambda.name}"
  policy_arn = "${aws_iam_policy.lambda_kms_decrypt_db.arn}"
}
