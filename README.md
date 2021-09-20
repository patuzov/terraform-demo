# Backend
* Create an Azure Storage resource [in the portal].
* Create a container that will hold the remote state
* Configure [azurerm backend](https://www.terraform.io/docs/language/settings/backends/azurerm.html)
* Reinitialize the working directory (`terraform init`)
  * CLI will ask whether existing state should be moved.
  * Move existing state to remote backend (`yes`)
* Run `terraform plan` to see that the state is in sync with the infrastrcutre
* Add resources for an [Azure Function and its App Service Plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app#example-usage-with-app-service-plan)