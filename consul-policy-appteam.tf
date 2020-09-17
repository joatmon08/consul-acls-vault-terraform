# consul-policy-appteam.tf

resource "consul_acl_policy" "intentions_read" {
  name  = "intentions-read"
  rules = <<-RULE
    service_prefix "" {
      policy = "read"
    }
    RULE
}

resource "consul_acl_policy" "app_key_read" {
  name  = "key-read"
  rules = <<-RULE
    key_prefix "app/" {
      policy = "list"
    }
    RULE
}

resource "vault_consul_secret_backend_role" "app_team" {
  name    = "app-team"
  backend = vault_consul_secret_backend.consul.path
  policies = [
    consul_acl_policy.intentions_read.name,
    consul_acl_policy.app_key_read.name,
  ]
}