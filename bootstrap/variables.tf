variable "location" {
  description = "Azure region for the remote-state resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group name for remote Terraform state."
  type        = string
  default     = "rg-terraform-state"
}
