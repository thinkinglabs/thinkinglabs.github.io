
locals {
  has_google_site_verification = var.google_site_verification == null ? 0 : 1

  has_spf   = var.spf == null ? 0 : 1
  has_dkim  = var.dkim == null ? 0 : 1
  has_dmarc = var.dmarc == null ? 0 : 1

  # OVH does not accept a TTL lower than 60 !
  ttl_ns  = 86400
  ttl_mx  = 28800
  ttl_a   = 10800
  ttl_spf = 3600
}

resource "ovh_domain_zone_record" "ns" {
  count     = length(var.name_servers)
  zone      = var.zone
  fieldtype = "NS"
  ttl       = local.ttl_ns
  target    = var.name_servers[count.index]
}

resource "ovh_domain_zone_record" "a" {
  count     = length(var.ipv4)
  zone      = var.zone
  fieldtype = "A"
  ttl       = local.ttl_a
  target    = var.ipv4[count.index]
}

resource "ovh_domain_zone_record" "cname" {
  count     = length(var.aliases)
  zone      = var.zone
  subdomain = var.aliases[count.index].subdomain
  fieldtype = "CNAME"
  ttl       = local.ttl_a
  target    = var.aliases[count.index].target
}

resource "ovh_domain_zone_redirection" "this" {
  count     = length(var.redirections)
  zone      = var.zone
  subdomain = var.redirections[count.index].subdomain
  type      = var.redirections[count.index].type
  target    = var.redirections[count.index].target
}

resource "ovh_domain_zone_record" "google_site_verification" {
  count     = local.has_google_site_verification
  zone      = var.zone
  fieldtype = "TXT"
  ttl       = local.ttl_a
  target    = "\"google-site-verification=${var.google_site_verification}\""
}

resource "ovh_domain_zone_record" "mx" {
  count     = length(var.mx)
  zone      = var.zone
  fieldtype = "MX"
  ttl       = local.ttl_mx
  target    = var.mx[count.index]
}

resource "ovh_domain_zone_record" "spf" {
  count     = local.has_spf
  zone      = var.zone
  fieldtype = "TXT"
  ttl       = local.ttl_spf
  target    = var.spf
}

resource "ovh_domain_zone_record" "dkim" {
  count     = local.has_dkim
  zone      = var.zone
  subdomain = "google._domainkey"
  fieldtype = "TXT"
  ttl       = local.ttl_spf
  target    = var.dkim
}

resource "ovh_domain_zone_record" "dmarc" {
  count     = local.has_dmarc
  zone      = var.zone
  subdomain = "_dmarc"
  fieldtype = "TXT"
  ttl       = local.ttl_spf
  target    = var.dmarc
}
