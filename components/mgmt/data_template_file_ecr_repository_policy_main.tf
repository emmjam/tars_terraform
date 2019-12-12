# This ECR Repository resource policy explictly permits
# the delegation of read access to our other Account IDs.
# Administrators or users granted permission explicitly
# in each account may perform these actions on the respository
# but they may not have write/destructive actions.
#
# This should be a data source. However, AWS ECR Resource Policies
# still require Policy Version "2008-10-17" which for some reason
# terraform provides no existing support for. Therefore we have to
# construct this as JSON from a template file.
data "template_file" "ecr_repository_policy_main" {
  template = file(
    "${path.module}/templates/ecr_repository_policy_main.json.tmpl",
  )

  vars = {
    RO_PRINCIPALS = jsonencode(
      formatlist(
        "%s:%s:%s",
        "arn:aws:iam:",
        var.ecr_repository_ro_principals,
        "root",
      ),
    )
  }
}

