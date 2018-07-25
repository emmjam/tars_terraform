# Get the wildfly batch AMI ID
data "aws_ami" "oraclexe" {
  name_regex = "OracleXE-230718"

  most_recent = "true"
  owners = [
    "${data.aws_caller_identity.current.account_id}",
  ]

  filter {
    name   = "state"
    values = ["available"]
  }
}
