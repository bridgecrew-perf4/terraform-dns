variable "name" {}
variable "kms-key" {}

resource "aws_route53_zone" "zone" {
  name = var.name
}

resource "aws_route53_key_signing_key" "zone" {
  hosted_zone_id             = aws_route53_zone.zone.id
  key_management_service_arn = var.kms-key.arn
  name                       = var.name
}

resource "aws_route53_hosted_zone_dnssec" "zone" {
  hosted_zone_id = aws_route53_key_signing_key.zone.hosted_zone_id
}

output "hosted-zone" {
  value = aws_route53_zone.zone
}
