terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider azurerm {
  features {}
}

resource "azurerm_resource_group" "demo" {
  name     = "demo"
  location = "West Europe"
}

resource "azurerm_storage_account" "demo" {
  name                     = "tfdemofuncsa"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
