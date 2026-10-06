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

module "storage" {
  source = "../../modules/storage"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  name_prefix         = local.name_prefix
  container_names     = var.storage_container_names

  tags = local.tags
}

module "database" {
  source = "../../modules/database"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  name_prefix         = local.name_prefix

  db_subnet_id = module.network.db_subnet_id
  vnet_id      = module.network.vnet_id

  admin_password = var.db_admin_password

  tags = local.tags
}

module "iam" {
  source = "../../modules/iam"

  user_names    = var.iam_user_names
  tenant_domain = var.tenant_domain
  rbac_scope    = azurerm_resource_group.main.id
}

module "monitoring" {
  source = "../../modules/monitoring"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  name_prefix         = local.name_prefix

  tags = local.tags
}