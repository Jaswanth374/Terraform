variable "ami_id" {
    type = string
    default ="ami-0220d79f3f480ecf5"
}

variable "sg_name" {

    type = string
    default = "sg_terrform_default"
}

variable "instance_type" {

    type = string
    default = "t3.micro"
}

variable "ec2_tags" {

    type = map
    default = {
        Name = "Terraform"
        project= "roboshop"
        env= "UAT" 
        }
}

variable "sg_tags" {

    type = map
    default = {
        Name = "sg_terrform_all"
        project= "roboshop"
        env= "UAT" 
        }
}

variable "from_port" {

    type = number
    default = 0
}

variable "to_port" {

    type = number
    default = 0
}

variable "cidr_blocks" {

    default = ["0.0.0.0/0"]
    type = list
}

variable "instances" {

    type = list
    default = ["Mongodb", "catalogue", "redis", "user", "cart", "mysql", "shipping", "rabbitmq", "payment", "frontend"]

}

variable "zone_id" {
    default = "Z07306682ZX5MBM0WBCUJ"
}

variable "domain_name" {
    default = "jaswanthdevops.online"
}