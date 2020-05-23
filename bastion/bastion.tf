provider "azurerm" {
  version = "2.7.0"
  features {}
}

resource "azurerm_resource_group" "bastion_rg" { 
  name      = var.bastion_rg
  location  = var.location
}

resource "azurerm_public_ip" "bastion_public_ip" { 
  name                  = "bastion-pip"
  location              = var.location
  resource_group_name   = azurerm_resource_group.bastion_rg.name
  allocation_method     = "Static"
  sku                   = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" { 
  name                  = "bastion-host"
  location              = var.location
  resource_group_name   = azurerm_resource_group.bastion_rg.name

  ip_configuration {
      name                  = "us2w"
      subnet_id             = data.terraform_remote_state.web.outputs.bastion_host_subnet_us2w
      public_ip_address_id  = azurerm_public_ip.bastion_public_ip.id
  }
}