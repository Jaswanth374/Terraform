module "ec2" {
source = "../terraform-ec2-instance"
ami = data.aws_ami.ami.id
project = var.project_name
sg_ids = var.sg_ids
environment = var.env
instance_type = "t3.large"
 tags = {
        Name = "${var.project_name}-${var.env}-${var.component}"
        Component = var.component
 }
}