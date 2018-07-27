resource "aws_iam_role" "oraclexe" {
  name = "${var.xe_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "oraclexe_profile" {
  name = "${var.xe_role_name}"
  role = "${aws_iam_role.oraclexe.name}"
}