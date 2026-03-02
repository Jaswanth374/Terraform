resource "aws_instance" "ec2_instance" {
  ami   = "ami-0220d79f3f480ecf5"
  instance_type = var.instance_type
  vpc_security_group_ids= [aws_security_group.allow_tls.id]
  tags = {
    Name = "roboshop-${var.env}"
    project= "roboshop"
    env= var.env
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "roboshop-sg-${var.env}"
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
    Name = "roboshop-sg-${var.env}"
    project= "roboshop"
    env= var.env

  }
}