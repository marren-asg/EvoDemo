/*output "ipaddres" {
      description = "Public IP for the VM: "
      value = azurerm_public_ip.testip.ip_address
}

output "public_ip_address" {
  value = azurerm_public_ip.testip.*.ip_address
}*/
      
output "vm_ids" {
  description = "Virtual machine name."
  value       =  azurerm_linux_virtual_machine.main.name
}

output "vm_location" {
  description = "Virtual machine location."
  value       =  azurerm_linux_virtual_machine.main.location
}
