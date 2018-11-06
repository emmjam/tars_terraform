resource "aws_iam_policy" "cwl_ec2" {
  count = "${length(var.cwl_names) == 0 ? 0 : 1}"

  name = "${format(
    "%s-%s-%s",
    local.csi,
    var.name,
    "cwl-ec2"
  )}"

  path   = "/"
  policy = "${data.aws_iam_policy_document.cwl_ec2.json}"
}

resource "aws_iam_role_policy_attachment" "cwl_ec2" {
  count      = "${length(var.cwl_names) == 0 ? 0 : 1}"
  role       = "${aws_iam_role.main.name}"
  policy_arn = "${aws_iam_policy.cwl_ec2.arn}"
}
