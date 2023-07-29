terraform {
  backend "azurerm" {
    resource_group_name  = "api-demo"
    storage_account_name = "tfbackendsa01"
    container_name       = "statefiles"
    key                  = "VZC3WfJwlYfmeVKhGHyfw01fEIUDNb3WRL0Tlra5JdZYoSBGjrTDQWSXXMlUWIRuLzdtxpYAgO23+AStwVuBxA=="
  }
}