
provider "ovh" {
  endpoint           = "ovh-eu"
  version            = "~> 0.5"
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

locals {
  zone_io = "thinkinglabs.io"
  be_zone    = "thinkinglabs.be"

  # OVH does not accept a TTL lower than 60 !
  ttl     = 86400
  ovh_ip  = "213.186.33.5"

  ns_records = [
    "dns109.ovh.net.",
    "ns109.ovh.net."
  ]

  gsuite_mx_records = [
    "1 aspmx.l.google.com.",
    "3 alt1.aspmx.l.google.com.",
    "3 alt2.aspmx.l.google.com.",
    "5 aspmx2.googlemail.com.",
    "5 aspmx3.googlemail.com."
  ]
}

resource "ovh_domain_zone_record" "io_name_server" {
  count     = length(local.ns_records)
  zone      = local.zone_io
  fieldtype = "NS"
  ttl       = 0
  target    = local.ns_records[count.index]
}

resource "ovh_domain_zone_record" "io_thinkinglabs" {
  count     = length(var.website_ip)
  zone      = local.zone_io
  fieldtype = "A"
  ttl       = 0
  target    = var.website_ip[count.index]
}

resource "ovh_domain_zone_record" "io_thinkinglabs_www" {
  zone      = local.zone_io
  subdomain = "www"
  fieldtype = "CNAME"
  ttl       = 0
  target    = "thinkinglabs.github.io."
}

resource "ovh_domain_zone_record" "io_gsuite_site_verification" {
  zone      = local.zone_io
  fieldtype = "TXT"
  ttl       = 60
  target    = "\"google-site-verification=w-hqEldYqh27TytmgxPWJbbmJJfFt7-qcRiCQjE8Q78\""
}

resource "ovh_domain_zone_record" "io_spf" {
  zone      = local.zone_io
  fieldtype = "SPF"
  ttl       = 0
  target    = "\"v=spf1 +all\""
}

resource "ovh_domain_zone_record" "io_gsuite_mail" {
  count     = length(local.gsuite_mx_records)
  zone      = local.zone_io
  fieldtype = "MX"
  ttl       = 0
  target    = local.gsuite_mx_records[count.index]
}

resource "ovh_domain_zone_record" "be_name_server" {
  count     = length(local.ns_records)
  zone      = local.be_zone
  fieldtype = "NS"
  ttl       = 0
  target    = local.ns_records[count.index]
}

resource "ovh_domain_zone_record" "be_thinkinglabs" {
  zone      = local.be_zone
  fieldtype = "A"
  ttl       = 0
  target    = local.ovh_ip
}

resource "ovh_domain_zone_record" "be_thinkinglabs_www" {
  zone      = local.be_zone
  subdomain = "www"
  fieldtype = "CNAME"
  ttl       = 0
  target    = "${local.be_zone}."
}

resource "ovh_domain_zone_redirection" "be_thinkinglabs" {
  zone      = local.be_zone
  subdomain = ""
  type      = "visiblePermanent"
  target    = "http://thinkinglabs.io"
}

resource "ovh_domain_zone_record" "be_spf" {
  zone      = local.be_zone
  fieldtype = "SPF"
  ttl       = 0
  target    = "\"v=spf1 +all\""
}
