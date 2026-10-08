output "id" {
  value = {
    for key, ip in azurerm_public_ip.public_ip :
    key => ip.id
  }
}

output "ip_address" {
  value = {
    for key, ip in azurerm_public_ip.public_ip :
    key => ip.ip_address
  }
}