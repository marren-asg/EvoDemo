
resource "azurerm_resource_group" "rg_group" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg_group.location
  resource_group_name = azurerm_resource_group.rg_group.name
  address_space       = ["10.0.0.0/24"]
}


resource "azurerm_subnet" "vnet_subnet" {
  name                 = var.snet_name
  resource_group_name  = azurerm_resource_group.rg_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/26"]
}


resource "azurerm_public_ip" "testip" {
  name                    = "${var.vm_name}-pip"
  resource_group_name     = azurerm_resource_group.rg_group.name
  location                = azurerm_resource_group.rg_group.location
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
}


resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  resource_group_name = azurerm_resource_group.rg_group.name
  location            = azurerm_resource_group.rg_group.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vnet_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.testip.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = azurerm_resource_group.rg_group.name
  location                        = azurerm_resource_group.rg_group.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  custom_data                     = base64encode(file("combo-install.sh"))
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS" //"20.04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
