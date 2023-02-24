
#creating 10 t2 micro instances with tags

resource "aws_instance" "create_10_intance" {
  count = 10

  ami           = "ami-06e0ce9d3339cb039"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance-${count.index}"
  }
}
 


#creating one instance on condition if environement = nonprod
 resource "aws_instance" "create_instance_nonprod" {
  count = var.account_environment == "nonprod" ? 1 : 0


  ami           = "aami-06e0ce9d3339cb039"
  instance_type = "t2.micro"

  tags = {
    Name = "nonprod_instance"
  }
}
 

 
 