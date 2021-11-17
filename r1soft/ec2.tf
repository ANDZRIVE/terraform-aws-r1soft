
resource "aws_instance" "r1soft" {
  ami                    = data.aws_ami.centos.id
  instance_type          = "t2.micro"
  availability_zone      = data.aws_availability_zones.all.names[0]
  vpc_security_group_ids = [aws_security_group.r1soft.id]
  key_name               = aws_key_pair.bastion.key_name

  tags = {
    Name = "r1soft"
  }
}












