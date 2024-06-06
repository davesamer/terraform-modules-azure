variable "azure_vm_setup_name" {
  description = "Prefix for the names of Azure resources"
  type        = string
}

variable "location" {
  description = "Location for the resource group"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "Password for the virtual machine"
  type        = string
  sensitive   = true
}

