# vault.tf

data "consul_acl_token_secret_id" "vault" {
  accessor_id = consul_acl_token.vault.id
}

resource "vault_consul_secret_backend" "consul" {
  path                      = "consul"
  description               = "Manages the Consul backend"
  address                   = "consul:8500"
  token                     = data.consul_acl_token_secret_id.vault.secret_id
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 3600
}

resource "vault_github_auth_backend" "org" {
  organization = "hashicorp"
}