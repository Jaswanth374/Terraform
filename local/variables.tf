variable "ami_id" {
    type = string
    default ="ami-0220d79f3f480ecf5"
}

variable "sg_name" {

    type = string
    default = "sg_terrform_locals"
}

variable "instance_type" {

    type = string
    default = "t3.micro"
}

variable "ec2_name" {

    default ="locals"
}

variable "environment" {
    default = "UAT"
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
        Name = "terraform-locals"
        
        }
}

variable "sg_tags" {

    type = map
    default = {
        Name = "sg_terrform_locals"
        }
}

