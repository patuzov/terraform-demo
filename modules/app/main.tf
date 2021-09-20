
resource "azurerm_storage_account" "demo" {
  name                     = "tfdemofuncsa"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "demo" {
  name                = "demo-azure-functions-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "demo" {
  name                       = "demo-azure-function"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.demo.id
  storage_account_name       = azurerm_storage_account.demo.name
  storage_account_access_key = azurerm_storage_account.demo.primary_access_key

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = var.application_insights_instrumentation_key
  }
}