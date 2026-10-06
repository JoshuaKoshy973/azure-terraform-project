resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_key_vault" "main" {
  name = "kv-${substr(replace(var.name_prefix, "-", ""), 0, 12)}-${random_string.suffix.result}"

  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id

  sku_name = "standard"

  purge_protection_enabled   = false
  soft_delete_retention_days = 7

  rbac_authorization_enabled = true

  tags = var.tags
}

resource "azurerm_role_assignment" "current_user_secrets_officer" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = var.current_user_object_id
}

resource "azurerm_key_vault_secret" "db_admin_password" {
  name         = "db-admin-password"
  value        = var.db_admin_password
  key_vault_id = azurerm_key_vault.main.id

  depends_on = [
    azurerm_role_assignment.current_user_secrets_officer
  ]
}