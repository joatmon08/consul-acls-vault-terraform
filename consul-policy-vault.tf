# consul-policy-vault.tf

data "consul_acl_policy" "management" {
  name = "global-management"
}

resource "consul_acl_token" "vault" {
  description = "ACL token for Consul secrets engine in Vault"
  policies    = [data.consul_acl_policy.management.name]
  local       = true
}
