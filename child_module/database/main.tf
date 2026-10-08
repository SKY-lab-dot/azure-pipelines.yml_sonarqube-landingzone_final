resource "azurerm_mssql_database" "database" {

  for_each = var.database

  name      = each.value.name
  server_id = each.value.server_id

  sku_name    = each.value.sku_name
  max_size_gb = each.value.max_size_gb

  collation = "SQL_Latin1_General_CP1_CI_AS"
  
}