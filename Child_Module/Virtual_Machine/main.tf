# Data source to fetch existing NICs
data "azurerm_network_interface" "nic" {
  for_each = var.vm

  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

# Create Linux VMs
resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vm

  name                = each.value.vm_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  size                = each.value.size
  #admin_username      = each.value.admin_username
  #admin_password      = each.value.admin_password
  admin_username = data.azurerm_key_vault_secret.vm_secret["secret1"].value
  admin_password = data.azurerm_key_vault_secret.vm_secret["secret2"].value


  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  # custom_data to install Nginx
  # -----------------------------
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
  )
  tags = each.value.tags
}
