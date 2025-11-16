# Public IP
resource "azurerm_public_ip" "pip" {
  for_each            = var.nic
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment = each.value.tags.environment
    owner       = each.value.tags.owner
  }
}

# Network Interface
resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "${each.value.nic_name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[each.key].id
    
  }
 
  tags = {
    environment = each.value.tags.environment
    owner       = each.value.tags.owner
  }
}


# Data source for existing subnet
data "azurerm_subnet" "subnet" {
  for_each = var.nic

  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
}



