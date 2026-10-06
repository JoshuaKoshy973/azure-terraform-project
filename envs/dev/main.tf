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

module "load_balancer" {
  source = "../../modules/load-balancer"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  name_prefix         = local.name_prefix
  tags                = local.tags
}

module "compute" {
  source = "../../modules/compute"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  name_prefix         = local.name_prefix

  subnet_id       = module.network.app_subnet_id
  backend_pool_id = module.load_balancer.backend_pool_id

  tags = local.tags
}
