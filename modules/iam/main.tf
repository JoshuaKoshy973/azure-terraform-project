resource "random_password" "users" {
  count = length(var.user_names)

  length  = 20
  special = true
}

resource "azuread_user" "users" {
  count = length(var.user_names)

  display_name        = var.user_names[count.index]
  user_principal_name = "${lower(var.user_names[count.index])}@${var.tenant_domain}"

  password              = random_password.users[count.index].result
  force_password_change = true
}

resource "azurerm_role_assignment" "readers" {
  count = length(var.user_names)

  scope                = var.rbac_scope
  role_definition_name = "Reader"
  principal_id         = azuread_user.users[count.index].object_id
}
