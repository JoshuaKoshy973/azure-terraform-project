variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "db_admin_password" {
  type      = string
  sensitive = true
}

variable "tags" {
  type = map(string)
}

variable "current_user_object_id" {
  type = string
}