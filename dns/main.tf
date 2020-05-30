
provider "ovh" {
  endpoint           = "ovh-eu"
  version            = "~> 0.5"
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

locals {
  # OVH does not accept a TTL lower than 60 !
  ttl     = 86400
  io_zone = "thinkinglabs.io"
  be_zone    = "thinkinglabs.be"

  ns_records = [
    "dns109.ovh.net.",
    "ns109.ovh.net."
  ]
  
  io_records = [
    { subdomain = "_autodiscover._tcp", fieldtype = "SRV", target = "0 0 443 mailconfig.ovh.net." },
    { subdomain = "_imaps._tcp", fieldtype = "SRV", target = "0 0 993 ssl0.ovh.net." },
    { subdomain = "_submission._tcp", fieldtype = "SRV", target = "0 0 465 ssl0.ovh.net." },
    { subdomain = "autoconfig", fieldtype = "CNAME", target = "mailconfig.ovh.net." },
    { subdomain = "autodiscover", fieldtype = "CNAME", target = "mailconfig.ovh.net." },
    { subdomain = "ftp", fieldtype = "CNAME", target = "thinkinglabs.io." },
    { subdomain = "imap", fieldtype = "CNAME", target = "ssl0.ovh.net." },
    { subdomain = "mail", fieldtype = "CNAME", target = "ssl0.ovh.net." },
    { subdomain = "pop3", fieldtype = "CNAME", target = "ssl0.ovh.net." },
    { subdomain = "smtp", fieldtype = "CNAME", target = "ssl0.ovh.net." },
    { subdomain = "www", fieldtype = "TXT", target = "\"3|welcome\"" },
  ]

  be_records = [
    { subdomain = "_autodiscover._tcp", fieldtype = "SRV", target = "0 0 443 mailconfig.ovh.net." },
    { subdomain = "_imaps._tcp", fieldtype = "SRV", target = "0 0 993 ssl0.ovh.net." },
    { subdomain = "_submission._tcp", fieldtype = "SRV", target = "0 0 465 ssl0.ovh.net." },
    { subdomain = "autoconfig", fieldtype = "CNAME", target = "mailconfig.ovh.net." },
    { subdomain = "autodiscover", fieldtype = "CNAME", target = "mailconfig.ovh.net." },
    { subdomain = "ftp", fieldtype = "CNAME", target = "thinkinglabs.be." },
    { subdomain = "imap", fieldtype = "CNAME", target = "ssl0.ovh.net." },
    { subdomain = "mail", fieldtype = "CNAME", target = "ssl0.ovh.net." },
    { subdomain = "pop3", fieldtype = "CNAME", target = "ssl0.ovh.net." },
    { subdomain = "smtp", fieldtype = "CNAME", target = "ssl0.ovh.net." },
    { subdomain = "www", fieldtype = "TXT", target = "\"3|welcome\"" },
  ]
}

resource "ovh_domain_zone_record" "io_name_server" {
  count     = length(local.ns_records)
  zone      = local.io_zone
  fieldtype = "NS"
  ttl       = 0
  target    = local.ns_records[count.index]
}

resource "ovh_domain_zone_record" "io_thinkinglabs" {
  count     = length(var.website_ip)
  zone      = local.io_zone
  fieldtype = "A"
  ttl       = 0
  target    = var.website_ip[count.index]
}

resource "ovh_domain_zone_record" "io_thinkinglabs_www" {
  zone      = local.io_zone
  subdomain = "www"
  fieldtype = "CNAME"
  ttl       = 0
  target    = "${local.io_zone}."
  # target    = "thinkinglabs.github.io."
}

resource "ovh_domain_zone_redirection" "io_thinkinglabs" {
  zone      = local.io_zone
  subdomain = ""
  type      = "visible"
  target    = "www.thinkinglabs.io"
}

resource "ovh_domain_zone_record" "io_thinkinglabs_records" {
  count     = length(local.io_records)
  zone      = local.io_zone
  subdomain = local.io_records[count.index].subdomain
  fieldtype = local.io_records[count.index].fieldtype
  ttl       = 0
  target    = local.io_records[count.index].target
}

resource "ovh_domain_zone_record" "be_name_server" {
  count     = length(local.ns_records)
  zone      = local.be_zone
  fieldtype = "NS"
  ttl       = 0
  target    = local.ns_records[count.index]
}

resource "ovh_domain_zone_record" "be_thinkinglabs" {
  count     = length(var.website_ip)
  zone      = local.be_zone
  fieldtype = "A"
  ttl       = 0
  target    = var.website_ip[count.index]
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
  type      = "visible"
  target    = "www.thinkinglabs.be"
}


resource "ovh_domain_zone_record" "be_thinkinglabs_records" {
  count     = length(local.be_records)
  zone      = local.be_zone
  subdomain = local.be_records[count.index].subdomain
  fieldtype = local.be_records[count.index].fieldtype
  ttl       = 0
  target    = local.be_records[count.index].target
}
