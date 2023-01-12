resource "aws_instance" "instance-1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  count = 3

  tags = {
    Name = var.instance-name[count.index]
  }
}
