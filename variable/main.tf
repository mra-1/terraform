resource "aws_instance" "tf-1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  tags = {
    Name = "tf1"
  }
}
resource "aws_eip" "ip-a" {
  vpc      = true
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.tf-1.id
  allocation_id = aws_eip.ip-a.id
}
resource "aws_security_group" "allow_tls" {
  name        = "tf-sg"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
   cidr_blocks = ["${aws_eip.ip-a.public_ip}/32"]
  }
}
