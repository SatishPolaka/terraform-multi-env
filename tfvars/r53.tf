resource "aws_route53_record" "expense" {
  count   = 3
  zone_id = var.zone_id
  name    = var.instance[count.index] == frontend && var.environment == "prod" ? var.domain_name : "${var.instance[count.index]}-${var.environment}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [var.instance[count.index] == frontend && var.environment == "prod" ? aws_instance.expense[count.index].public_ip:aws_instance.expense[count.index].private_ip]
  allow_overwrite = true


}

# resource "aws_route53_record" "frontend" {
#   allow_overwrite = true
#   zone_id = var.zone_id
#   name    = var.domain_name #interpolation syntax
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.expense[2].public_ip]
# }