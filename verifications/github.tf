variable "hosted-zone" {}

resource "aws_route53_record" "github-domain-verification" {
  zone_id = var.hosted-zone.id
  name    = "_github-challenge-kwiniaskaridge.www.kwiniaskaridge.org"
  type    = "TXT"
  ttl = 3600

  records = [
    "49d944dd6a"
  ]
}
