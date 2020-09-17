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
  backend "remote" {}
}

provider "consul" {
  address    = "127.0.0.1:8500"
  datacenter = "dc1"
}

provider "vault" {
  address = "http://127.0.0.1:8200"
}