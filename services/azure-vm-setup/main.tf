resource "azurerm_resource_group" "rg" {
  name     = "${var.azure_vm_setup_name}_rg"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.azure_vm_setup_name}_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.azure_vm_setup_name}_subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.azure_vm_setup_name}_ip_address"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.azure_vm_setup_name}_nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.azure_vm_setup_name}_nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "${var.azure_vm_setup_name}vm"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic.id]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  connection {
    type     = "ssh"
    user     = var.admin_username
    password = var.admin_password # Note: Using passwords is less secure, consider using SSH keys
    host     = azurerm_public_ip.public_ip.ip_address
  }

  custom_data = filebase64("${path.root}/cloud-init.sh")
}

