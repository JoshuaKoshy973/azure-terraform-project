resource "azurerm_private_dns_zone" "postgres" {
  name                = "dev.postgres.database.azure.com"
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres" {
  name                  = "link-${var.name_prefix}-postgres"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.postgres.name
  virtual_network_id    = var.vnet_id

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server" "main" {
  name                = "psql-${var.name_prefix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = "16"

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  sku_name   = "B_Standard_B1ms"
  storage_mb = 32768

  delegated_subnet_id = var.db_subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.postgres.id

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  tags = var.tags

  public_network_access_enabled = false

  lifecycle {
    ignore_changes = [
      zone
    ]
  }

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.postgres
  ]
}
