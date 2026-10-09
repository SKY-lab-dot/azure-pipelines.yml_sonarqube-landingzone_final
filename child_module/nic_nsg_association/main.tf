resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {

  for_each = var.nic_nsg_association

  network_interface_id      = each.value.nic_id
  network_security_group_id = each.value.nsg_id
}