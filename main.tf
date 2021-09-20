terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }

  backend azurerm {
    resource_group_name  = "durable-rg"
    storage_account_name = "patuterraformbe"
    container_name       = "boss"
    key                  = "tfstate"
  }
}

provider azurerm {
  features {}
}

resource "azurerm_resource_group" "demo" {
  name     = "boss"
  location = "West Europe"
}

resource "azurerm_storage_account" "demo" {
  name                     = "tfdemofuncsa"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "demo" {
  name                = "boss-demo-azure-functions-service-plan"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "demo" {
  name                       = "boss-demo-azure-function"
  location                   = azurerm_resource_group.demo.location
  resource_group_name        = azurerm_resource_group.demo.name
  app_service_plan_id        = azurerm_app_service_plan.demo.id
  storage_account_name       = azurerm_storage_account.demo.name
  storage_account_access_key = azurerm_storage_account.demo.primary_access_key
}