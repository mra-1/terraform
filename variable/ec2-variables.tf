resource "aws_instance" "var-ec2" {
  ami = "ami-0b5eea76982371e91"
  instance_type = var.instancetype

  tags = {
    Name = "var2"
  }
}
