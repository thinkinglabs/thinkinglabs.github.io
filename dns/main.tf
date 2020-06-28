
provider "ovh" {
  endpoint           = "ovh-eu"
  version            = "~> 0.5"
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

locals {
  zone_io = "thinkinglabs.io"
  zone_be = "thinkinglabs.be"

  ovh_ip  = "213.186.33.5"

  name_servers = [
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

  spf = "\"v=spf1 include:_spf.google.com ~all\""
}

module "io" {
  source = "./modules/zone"

  zone         = local.zone_io
  name_servers = local.name_servers
  ipv4         = var.website_ip
  aliases      = [
    {subdomain = "www", target = "thinkinglabs.github.io."}
  ]

  google_site_verification = "w-hqEldYqh27TytmgxPWJbbmJJfFt7-qcRiCQjE8Q78"

  mx   = local.gsuite_mx_records
  spf  = local.spf
}

module "be" {
  source = "./modules/zone"

  zone         = local.zone_be
  name_servers = local.name_servers
  ipv4         = [local.ovh_ip]
  aliases      = [
    {subdomain = "www", target = "${local.zone_be}."}
  ]
  redirections = [
    {subdomain = "", type = "visiblePermanent", target = "http://thinkinglabs.io"}
  ]
}
