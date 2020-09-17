# vault-appteam.tf
resource "vault_policy" "app_team" {
  name = "app-team"

  policy = <<EOT
path "consul/creds/app-team" {
  capabilities = ["read"]
}
EOT
}

resource "vault_github_team" "app_team" {
  backend = vault_github_auth_backend.org.id
  team    = "community"
  policies = [
    vault_policy.app_team.name
  ]
}