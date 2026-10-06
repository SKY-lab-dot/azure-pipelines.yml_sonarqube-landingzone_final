resource "azurerm_network_interface" "nic" {

  for_each = var.nic

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                          = "internal"
   subnet_id                     = each.value.subnet_id
   private_ip_address_allocation = "Dynamic"

    #public_ip_address_id = each.value.public_ip_id
  }
}
