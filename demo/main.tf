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
    container_name       = "demo"
    key                  = "tfstate"
  }
}

provider azurerm {
  features {}
}

resource "azurerm_resource_group" "demo" {
  name     = "demo"
  location = "West Europe"
}

module "app" {
  source = "../modules/app"

  resource_group_name                      = azurerm_resource_group.demo.name
  location                                 = azurerm_resource_group.demo.location
  application_insights_instrumentation_key = module.monitoring.application_insights_instrumentation_key
}

module "monitoring" {
  source = "../modules/monitoring"

  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
}

// module "monitoring" {
//   source = "github.com/patuzov/terraform-demo-modules?ref=v2.0"
  
//   rg_name  = azurerm_resource_group.demo.name
//   location = azurerm_resource_group.demo.location
// }