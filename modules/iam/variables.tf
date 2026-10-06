variable "user_names" {
  description = "Users to create in Microsoft Entra ID."
  type        = list(string)
}

variable "tenant_domain" {
  description = "Microsoft Entra tenant domain used for user principal names."
  type        = string
}

variable "rbac_scope" {
  description = "Azure scope where RBAC permissions will be assigned."
  type        = string
}
