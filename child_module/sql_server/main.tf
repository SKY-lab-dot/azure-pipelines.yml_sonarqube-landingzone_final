resource "azurerm_mssql_server" "sql_server" {
  name                = var.sql_server.name
  resource_group_name = var.sql_server.resource_group_name
  location            = var.sql_server.location

  version = "12.0"

  administrator_login          = var.sql_server.administrator_login
  administrator_login_password = var.sql_server.administrator_login_password

  public_network_access_enabled = true

  minimum_tls_version = "1.2"
}