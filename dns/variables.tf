
variable "website_ip" {
  description = "IP address for the website thinkinglabs.io"
  type        = list(string)
  default = [
    "213.186.33.5"
  ]
}

variable "ovh_application_key" {
  type = string
}

variable "ovh_application_secret" {
  type = string
}

variable "ovh_consumer_key" {
  type = string
}
