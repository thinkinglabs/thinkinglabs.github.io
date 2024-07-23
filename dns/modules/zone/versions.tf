
terraform {
  required_version = ">= 1.6"
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.5"
    }
  }
}
