resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = each.key == "sonarqube" ? [1] : []

    content {
      name                       = "Allow-SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = var.ssh_source_address
      destination_address_prefix = "*"
    }
  }

  dynamic "security_rule" {
    for_each = each.key == "sonarqube" ? [1] : []

    content {
      name                       = "Allow-SonarQube"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "9000"
      source_address_prefix      = var.sonarqube_source_address
      destination_address_prefix = "*"
    }
  }
}
