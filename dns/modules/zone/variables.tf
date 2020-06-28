
variable "zone" {
  description = "DNS domain"
  type        = string
}

variable "name_servers" {
  description = "IP or domain name of name servers"
  type        = list(string)
}

variable "ipv4" {
  description = "List of A record target IPs"
  type        = list(string)
}

variable "aliases" {
  description = "List of CNAME aliases"
  type = list(object({
    subdomain = string
    target    = string
  }))
  default = []
}

variable "redirections" {
  description = "List of HTTP redirections"
  type = list(object({
    subdomain = string
    type      = string
    target    = string
  }))
  default = []
}

variable "google_site_verification" {
  description = "Verification code used by GSuite to check for ownership"
  type        = string
  default     = null
}

variable "mx" {
  description = "MX records"
  type        = list(string)
  default     = []
}

variable "spf" {
  description = "SPF record"
  type        = string
  default     = null
}

variable "dkim" {
  description = "DKIM record"
  type        = string
  default     = null
}

variable "dmarc" {
  description = "DMARC record"
  type        = string
  default     = null
}
