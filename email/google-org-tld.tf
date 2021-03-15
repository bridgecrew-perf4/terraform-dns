# Google Email DNS entries for kwiniaskaridge.org

variable "hosted-zone" {}

resource "aws_route53_record" "google-org-tld" {
  zone_id = var.hosted-zone.id
  name    = var.hosted-zone.name
  type    = "MX"

  records = [
    "1 ASPMX.L.GOOGLE.COM.",
    "5 ALT1.ASPMX.L.GOOGLE.COM.",
    "5 ALT2.ASPMX.L.GOOGLE.COM.",
    "10 ALT3.ASPMX.L.GOOGLE.COM.",
    "10 ALT4.ASPMX.L.GOOGLE.COM.",
    "15 3zf5ztqnguwgxle3oj4hkoj3q733xs5io6ak5pcqzx5tx3y2llla.mx-verification.google.com.",
  ]

  ttl = 3600
}
