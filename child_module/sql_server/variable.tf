variable "sql_server" {
  type = object({
    name                         = string
    resource_group_name          = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
  })

  sensitive = true
}