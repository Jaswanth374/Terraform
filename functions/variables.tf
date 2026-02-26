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

variable "common_tags" {
    type = map
    default = {
        project= "roboshop"
        env= "UAT"

    }
}
variable "ec2_tags" {

    type = map
    default = {
        Name = "Terraform"
         
        }
}

variable "sg_tags" {

    type = map
    default = {
        Name = "sg_terrform_default"
    
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
