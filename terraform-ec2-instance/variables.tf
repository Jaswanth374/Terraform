variable "ami" {
    type = string
}

variable "environment" {
    type = string
}

variable "project" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "tags" {
    type = map
    default = {}
}

variable "sg_ids" {
    type = list(string)
}