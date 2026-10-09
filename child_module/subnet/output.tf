output "id" {
  value = {
    for key, snet in azurerm_subnet.snet :
    key => snet.id
  }
} 
