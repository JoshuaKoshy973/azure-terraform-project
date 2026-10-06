locals {
  name_prefix = "${var.project_name}-${var.environment}"

  tags = merge(
    var.common_tags,
    {
      environment = var.environment
    }
  )
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${local.name_prefix}"
  location = var.location

  tags = local.tags
}

module "network" {
  source = "../../modules/network"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  name_prefix         = local.name_prefix

  vnet_address_space = var.vnet_address_space
  app_subnet_prefix  = var.app_subnet_prefix
  db_subnet_prefix   = var.db_subnet_prefix

  tags = local.tags
}