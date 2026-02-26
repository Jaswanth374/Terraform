resource "aws_route53_record" "route53_record" {
  zone_id = var.zone_id
  count = 10
  name    = "${var.instances[count.index]}.${var.domain_name}" #user.jaswanthdevops.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.ec2_instance[count.index].private_ip]
  allow_overwrite = true
}


resource "aws_route53_record" "route53_public_record" {
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}" #roboshop.jaswanthdevops.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.ec2_instance[index(var.instances, "frontend")].public_ip]
  allow_overwrite = true
}