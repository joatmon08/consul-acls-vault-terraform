# provider.tf

terraform {
  required_version = "~>0.13"
  required_providers {
    consul = {
      version = "~> 2.9.0"
    }
    vault = {
      version = "~> 2.12.2"
    }
  }
}

provider "consul" {
  datacenter = "dc1"
}

provider "vault" {}