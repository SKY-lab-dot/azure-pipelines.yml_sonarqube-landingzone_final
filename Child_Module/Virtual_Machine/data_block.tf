
data "azurerm_key_vault" "kv" {
  for_each            = var.keyvaults
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "vm_secret" {
  for_each = var.secrets

  name         = each.value.name
  key_vault_id = data.azurerm_key_vault.kv[each.value.keyvault_key].id
}
