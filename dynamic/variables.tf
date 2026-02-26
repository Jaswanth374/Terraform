/* variable "instances" {
  default = ["web", "app", "db"]
} */

variable "instances_map" {

    default = {

        web = "t3.micro"
        app = "t3.small"
        db = "t3.micro"
    }
}
/* 

variable "ports" {

    default = [80, 443, 8080]
} */


variable "ports" {

    default = [

          {
            port = 22
            cidr_blocks = ["0.0.0.0/0"]
            description = "allowing port number 22 from internet"
        },
        {
            port = 443
            cidr_blocks = ["0.0.0.0/0"]
            description = "allowing port number 443 from internet"
        },
        {
            port = 3306
            cidr_blocks = ["0.0.0.0/0"]
            description = "allowing port number 3306 from internet"
        }
    ]



}