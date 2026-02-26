resource "aws_route53_record" "private" {
  for_each = var.instances_map
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #web.jaswanthdevops.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.example[each.key].private_ip]
}


resource "aws_route53_record" "public" {
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}" #roboshop.jaswanthdevops.online
  type    = "A"
  ttl     = 1

  records = [lookup(aws_instance.example,"web").public_ip]
}