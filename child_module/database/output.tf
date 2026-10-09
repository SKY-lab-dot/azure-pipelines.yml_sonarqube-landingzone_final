output "id" {
  value = {
    for key, db in azurerm_mssql_database.database :
    key => db.id
  }
}

output "name" {
  value = {
    for key, db in azurerm_mssql_database.database :
    key => db.name
  }
}