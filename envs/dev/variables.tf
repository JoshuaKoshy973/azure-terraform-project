variable "location" {
  description = "Azure region for the development environment."
  type        = string
  default     = "eastus"
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
