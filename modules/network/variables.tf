variable "resource_group_name" {
  description = "Resource group where network resources will be created."
  type        = string
}

variable "location" {
  description = "Azure region for network resources."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for naming network resources."
  type        = string
}

variable "vnet_address_space" {
  description = "CIDR address space for the virtual network."
  type        = list(string)
}

variable "app_subnet_prefix" {
  description = "CIDR prefix for the application subnet."
  type        = string
}

variable "db_subnet_prefix" {
  description = "CIDR prefix for the database subnet."
  type        = string
}

variable "tags" {
  description = "Tags applied to network resources."
  type        = map(string)
}