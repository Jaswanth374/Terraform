resource "aws_instance" "ec2_instance" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids= [aws_security_group.allow_tls.id]
  tags = {
    Name = "Terraform"
    project= "roboshop"
    env= "UAT"
  }
  # provisioner "local-exec" {
  #   command = "echo 'Server deployed with IP: ${self.private_ip}' >> instance_ips.txt"
  # }

  connection {
        type        = "ssh"
        host        = self.public_ip
        user        = "ec2-user"
        password = "DevOps321"
        timeout     = "5m"
      }
  provisioner "remote-exec" {

    inline = [

      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" { 
    when = destroy
      inline = [

        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
      ]
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