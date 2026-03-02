locals {
    ami_id = data.aws_ami.ami.id
    environment = terraform.workspace

}