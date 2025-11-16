# Fetch existing SQL Server
data "azurerm_mssql_server" "server" {
  for_each = var.databases

  name                = each.value.server_name
  resource_group_name = each.value.rg_name
}

# Create SQL Databases
resource "azurerm_mssql_database" "database" {
  for_each = var.databases

  name           = each.value.db_name
  server_id      = data.azurerm_mssql_server.server[each.key].id
  collation      = each.value.collation
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  read_scale     = each.value.read_scale
  sku_name       = each.value.sku_name
  zone_redundant = each.value.zone_redundant
}
