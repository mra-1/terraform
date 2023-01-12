  variable "istest" {
  }  

resource "aws_instance" "dev" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  count = var.istest == true ? 1 : 0
  tags = {
  name = "dev1"
  }
}

resource "aws_instance" "prod" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  count = var.istest == false ? 1 : 0
  tags = {
  name = "prod1"
  }
}
