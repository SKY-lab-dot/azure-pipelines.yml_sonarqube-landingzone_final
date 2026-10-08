resource "azurerm_key_vault" "keyvault" {
  name                = var.keyvault.name
  location            = var.keyvault.location
  resource_group_name = var.keyvault.resource_group_name

  tenant_id = var.tenant_id

  sku_name = "standard"

  purge_protection_enabled   = false
  soft_delete_retention_days = 7

  public_network_access_enabled = true
}