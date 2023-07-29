provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = data.azurerm_resource_group.aks.location
  resource_group_name = data.azurerm_resource_group.aks.name
  dns_prefix          = var.dns_prefix_name
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                = var.node_pool_name
    node_count          = var.node_count
    vm_size             = var.node_pool_vm_size
    vnet_subnet_id      = var.subnet_id  
    enable_auto_scaling = var.enable_auto_scaling  # Optional: set to true for auto-scaling
  }

  service_principal {
      client_id = var.service_principle_client_id
      client_secret = var.service_principle_client_secret
      }
  tags = {
    environment = "dev"
  }
}
