variable "location" {
  description = "Azure region for the development environment."
  type        = string
  default     = "southcentralus"
}

variable "environment" {
  description = "Environment name used in resource naming and tags."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Short project name used in resource naming."
  type        = string
  default     = "azure-terraform"
}

variable "common_tags" {
  description = "Common tags applied to Azure resources."
  type        = map(string)
  default = {
    managed_by  = "terraform"
    project     = "azure-terraform-project"
    environment = "dev"
  }
}

variable "vnet_address_space" {
  description = "Address space for the development VNet."
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "app_subnet_prefix" {
  description = "CIDR prefix for the application subnet."
  type        = string
  default     = "10.20.1.0/24"
}

variable "db_subnet_prefix" {
  description = "CIDR prefix for the database subnet."
  type        = string
  default     = "10.20.2.0/24"
}

variable "storage_container_names" {
  description = "Blob containers required by the development environment."
  type        = set(string)

  default = [
    "product-images",
    "application-logs",
    "backups"
  ]
}

variable "db_admin_password" {
  description = "Administrator password for PostgreSQL."
  type        = string
  sensitive   = true
}