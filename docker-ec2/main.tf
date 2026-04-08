resource "aws_instance" "main" {
    ami = local.ami_id
   instance_type = "t3.micro"
    vpc_security_group_ids= [aws_security_group.allow_tls.id]
    tags = {
        Name = "Docker-Eksctl-Workstation"
        project= "roboshop"
        env= "UAT"
    }
    root_block_device {
    volume_size = 50
    volume_type = "gp3"
    # EBS volume tags
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "Docker-Eksctl-Workstation"
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
    Name = "Docker-Eksctl-Workstation"
  }
} 

resource "terraform_data" "main" {
    triggers_replace = [
    aws_instance.main.id
  ]
  connection {
    type        = "ssh"
    host        = aws_instance.main.public_ip
    user        = "ec2-user"
    password = "DevOps321"
    timeout     = "5m"
    }

  provisioner "remote-exec" {
    inline = [
    "sudo growpart /dev/nvme0n1 4",
    "sudo lvextend -L +30G /dev/RootVG/varVol",
    "sudo xfs_growfs /var",
    "sudo dnf -y install dnf-plugins-core",
    "sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo",
    "sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y",
    "sudo systemctl start docker",
    "sudo systemctl enable docker",
    "sudo usermod -aG docker ec2-user",
    "ARCH=amd64",
    "PLATFORM=$(uname -s)_$ARCH",
    "curl -sLO https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz",
    "tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz",
    "sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl",
    "curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.35.2/2026-02-27/bin/linux/amd64/kubectl",
    "chmod +x ./kubectl",
    "mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH"
    ]
  }
}
