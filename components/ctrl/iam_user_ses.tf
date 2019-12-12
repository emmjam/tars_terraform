# TODO: peacheym: Why does this username end with a hyphen?
#                 Presume it's a copypasta fail from a resource
#                 that uses name_prefix(?)
resource "aws_iam_user" "ses_user" {
  name = "${local.csi}-ses-"
  path = "/"
}

