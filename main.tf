provider "azurerm" {
  version = "2.7.0"
  features {}
}

provider "random" {
  version = "2.2"
}

module "location_us2w" {
  source = "./location"

  resource_prefix           = "${var.resource_prefix}-us2w"
  web_server_location       = "westus2"
  web_server_rg             = "${var.web_server_rg}-us2w"
  web_server_address_space  = "10.0.0.0/22"
  web_server_name           = var.web_server_name
  environment               = var.environment
  web_server_count          = var.web_server_count
  web_server_subnets        = {
    web-server              = "10.0.1.0/24"
    AzureBastionSubnet      = "10.0.2.0/24"
  }
  terraform_script_version  = var.terraform_script_version
  admin_password            = data.azurerm_key_vault_secret.admin_password.value
}

module "location_us2e" {
  source = "./location"

  resource_prefix           = "${var.resource_prefix}-us2e"
  web_server_location       = "eastus2"
  web_server_rg             = "${var.web_server_rg}-us2e"
  web_server_address_space  = "20.0.0.0/22"
  web_server_name           = var.web_server_name
  environment               = var.environment
  web_server_count          = var.web_server_count
  web_server_subnets        = {
    web-server              = "20.0.1.0/24"
    AzureBastionSubnet      = "20.0.2.0/24"
  }
  terraform_script_version  = var.terraform_script_version
  admin_password            = data.azurerm_key_vault_secret.admin_password.value
}