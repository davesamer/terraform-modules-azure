output "vm_name" {
  description = "Name of the Azure virtual machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "azure_vm_setup_name" {
  value = var.azure_vm_setup_name
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}