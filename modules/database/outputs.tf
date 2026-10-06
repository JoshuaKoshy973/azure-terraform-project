output "database_id" {
  value = azurerm_postgresql_flexible_server.main.id
}

output "database_fqdn" {
  value = azurerm_postgresql_flexible_server.main.fqdn
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.postgres.id
}