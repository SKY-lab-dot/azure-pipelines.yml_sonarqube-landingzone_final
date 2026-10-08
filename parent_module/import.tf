import {
  to = module.public_ip.azurerm_public_ip.public_ip["pip2"]
  id = "/subscriptions/6670366d-32db-4180-a842-1ce1053317b7/resourceGroups/riya/providers/Microsoft.Network/publicIPAddresses/riya-pip2"
}

import {
  to = module.nsg.azurerm_network_security_group.nsg["nsg1"]
  id = "/subscriptions/6670366d-32db-4180-a842-1ce1053317b7/resourceGroups/riya/providers/Microsoft.Network/networkSecurityGroups/riya_nsg1"
}