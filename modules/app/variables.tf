variable resource_group_name {
  type        = string
  description = "The of the pre existing resource group."
}

variable location {
  type        = string
  description = "Location where all resources will be created."
}

variable application_insights_instrumentation_key {
    type = string
}