resource "aws_iam_role_policy_attachment" "tars-messaging" {
  role       = data.terraform_remote_state.base.outputs.tars_messaging_iam_instance_profile_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}