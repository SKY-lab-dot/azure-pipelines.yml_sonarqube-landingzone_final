output "vm_id" {
  value = azurerm_linux_virtual_machine.sonarqube.id
}

output "public_ip_id" {
  value = azurerm_public_ip.sonarqube.id
}

output "public_ip_address" {
  value = azurerm_public_ip.sonarqube.ip_address
}

output "private_ip_address" {
  value = azurerm_network_interface.sonarqube.private_ip_address
}

output "sonarqube_url" {
  value = "http://${azurerm_public_ip.sonarqube.ip_address}:9000"
}