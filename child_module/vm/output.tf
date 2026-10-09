output "vm_ids" {
  value = {
    for key, vm in azurerm_linux_virtual_machine.vm :
    key => vm.id
  }
}