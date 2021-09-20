# Terraform Basics
* Create the *main.tf* file, define the [terraform block](https://www.terraform.io/docs/language/settings/index.html) and configure [azure provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#example-usage)
* Add the [Azure Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) resource
* [Authenticate with Azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli) (`az login`)
* [Initialize](https://www.terraform.io/docs/cli/commands/init.html) the working directory (`terraform init`)
* Check the [execution plan](https://www.terraform.io/docs/cli/commands/plan.html) (`terraform plan`)
* [Apply changes](https://www.terraform.io/docs/cli/commands/apply.html) (`terraform apply`)
* Add a [storage account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) to the newly created resource group
  * Note how name of the resource group is obtained from *azurerm_resource_group* resource. It creates **implicit dependency** between the two resources.
* Check the execution plan (`terraform plan`)
  * Notice that the resource group remains unchanged
* Apply changes (`terraform apply`)
* [Optional] [Destroy](https://www.terraform.io/docs/cli/commands/destroy.html) created infrastructure (`terraform destroy`)
