resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.micro"
  vpc_security_group_ids= [aws_security_group.allow_tls.id]
  tags = {
    Name = "Terraform"
    project= "roboshop"
    env= "UAT"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "Terraform_Security_Group"
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }


  tags = {
    Name = "Terraform_Security_Group"
  }
}