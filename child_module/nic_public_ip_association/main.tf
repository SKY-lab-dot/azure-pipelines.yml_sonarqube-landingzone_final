resource "azurerm_network_interface" "nic" {

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.snet_id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = var.public_ip_id
  }
}