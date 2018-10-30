# Get the wildfly batch AMI ID
data "aws_ami" "oraclexe" {
  name_regex = "OracleXE180828"

  most_recent = "true"

  owners = [
    "246976497890",
  ]

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}
