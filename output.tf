/*output "ipaddres" {
      description = "Public IP for the VM: "
      value = azurerm_public_ip.testip.ip_address
}*/


output "public_ip_address" {
  value = azurerm_public_ip.testip.*.ip_address
}