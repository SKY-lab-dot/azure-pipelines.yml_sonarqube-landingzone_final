output "subnet_ids" {
    value = {
        for key,subnet in azurerm_subnet.snet:
    key=>subnet.id
}
}