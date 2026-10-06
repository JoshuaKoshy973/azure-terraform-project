output "resource_group_name" {
  description = "Name of the development resource group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "Resource ID of the development resource group."
  value       = azurerm_resource_group.main.id
}

output "vnet_id" {
  description = "ID of the development virtual network."
  value       = module.network.vnet_id
}

output "app_subnet_id" {
  description = "ID of the application subnet."
  value       = module.network.app_subnet_id
}

output "db_subnet_id" {
  description = "ID of the database subnet."
  value       = module.network.db_subnet_id
}

output "app_nsg_id" {
  description = "ID of the application NSG."
  value       = module.network.app_nsg_id
}

output "db_nsg_id" {
  description = "ID of the database NSG."
  value       = module.network.db_nsg_id
}

output "load_balancer_public_ip" {
  value = module.load_balancer.public_ip_address
}

output "vmss_id" {
  value = module.compute.vmss_id
}

output "vmss_name" {
  value = module.compute.vmss_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_container_names" {
  value = module.storage.container_names
}

output "database_fqdn" {
  value = module.database.database_fqdn
}

output "iam_user_names" {
  value = module.iam.user_names
}

output "iam_user_principal_names" {
  value = module.iam.user_principal_names
}

output "log_analytics_workspace_name" {
  value = module.monitoring.workspace_name
}

output "key_vault_name" {
  value = module.key_vault.key_vault_name
}

output "vnet_name" {
  value = module.network.vnet_name
}