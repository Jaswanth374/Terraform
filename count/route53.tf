resource "aws_route53_record" "route53_record" {
  zone_id = var.zone_id
  count = 10
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.ec2_instance[count.index].private_ip]
}