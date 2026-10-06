output "resource_group_name" {
  description = "Name of the development resource group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "Resource ID of the development resource group."
  value       = azurerm_resource_group.main.id
}