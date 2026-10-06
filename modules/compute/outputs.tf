output "vmss_id" {
  value = azurerm_linux_virtual_machine_scale_set.app.id
}

output "vmss_name" {
  value = azurerm_linux_virtual_machine_scale_set.app.name
}