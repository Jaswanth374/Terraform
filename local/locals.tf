locals {

instance_type = "t3.micro"
name = "${var.ec2_name}-${var.environment}"
instance_tags = merge (var.common_tags, var.ec2_tags)
security_tags = merge (var.common_tags, var.sg_tags)

}