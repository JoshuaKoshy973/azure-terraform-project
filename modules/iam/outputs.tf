output "user_names" {
  value = azuread_user.users[*].display_name
}

output "user_principal_names" {
  value = azuread_user.users[*].user_principal_name
}

output "user_object_ids" {
  value = azuread_user.users[*].object_id
}