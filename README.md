# Backend

## Extract module
* Create a folder [demo] and move the *main.tf* file in it
* Run `terraform` init to reinitialize directory
* Run `terraform plan` in the *demo* folder to see that the state is in sync with the infrastrcutre
* Create *modules* folder and *app* folder inside it
* In the *app* folder create *main.tf* and *variables.tf* files
* Move *function* related code to the module's *main.tf* file (*azurerm_storage_account*, *azurerm_app_service_plan*, *azurerm_function_app*)
* Extract *resource group name* and *location* as [variables](https://www.terraform.io/docs/language/values/variables.html)
* Reference extracted variables in all resources
* In the *main.tf* file under *demo* folder, use the newly created module
  * provide relative path in the *source*
  * provide required input variables (resource group name and locaiton)
* Run `terraform apply`
  * **WARNING:** notice that the app resources will be recreated. Normally, you will [move the state](https://www.terraform.io/docs/cli/commands/state/mv.html) in order not to unnecessary recreate the infrastructure. But for this demo's purposes we will go the *easy way*.
  * **NOTE:** the destroy operation might take longer than the validation for new resources and you might get an error that the resources with given names already exist. Re-run `terraform apply` command - the resources will be already destroyed by that time

## Reference module
* Create a new module: *monitoring*
* Add *main.tf*, *variables.tf* and *outputs.tf* files to the module
* Add *azurerm_log_analytics_workspace* and *azurerm_application_insights* resources to the module
* Add required input variables: resource group name and location
* Define Application Insight's instrumentation key in the [output](https://www.terraform.io/docs/language/values/outputs.html) (to be later used by the azure function)
* Use the monitoring module in the demo module
* Run `terraform init` to install the new module
* Run `terraform apply` to create monitoring resources
* Use Application Insights instrumentation key in the app module
  * Add *instrumentation key* input variable to the app module
  * Use it the *app_settings* block in the *azurerm_function_app* resource
    ```json
    app_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY = var.application_insights_instrumentation_key
    }
    ```
  * Configure instrumentation key's value in the *app* module as the output of the *monitoring* module