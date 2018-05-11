data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "virtualization-type"

    values = [
      "hvm",
    ]
  }

  filter {
    name = "root-device-type"

    values = [
      "ebs",
    ]
  }

  filter {
    name = "block-device-mapping.volume-type"

    values = [
      "gp2",
    ]
  }

  filter {
    name = "architecture"

    values = [
      "x86_64",
    ]
  }

  owners = [
    "137112412989",
  ]
}

