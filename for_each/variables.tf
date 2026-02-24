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

variable "zone_id" {
    default = "Z07306682ZX5MBM0WBCUJ"
}

variable "domain_name" {
    default = "jaswanthdevops.online"
}