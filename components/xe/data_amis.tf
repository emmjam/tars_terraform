# Get the wildfly batch AMI ID
data "aws_ami" "oraclexe" {
  name_regex = "${var.xe_ami_name}"

  most_recent = "true"

  # owners = [
  #   "652856684323",
  # ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}
