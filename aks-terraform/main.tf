provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks" {
  name     = "api-demo"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "myakscluster"
  kubernetes_version  = "1.21.0"

  default_node_pool {
    name                = "default"
    node_count          = 2
    vm_size             = "Standard_D2_v2"
    vnet_subnet_id      = "/subscriptions/e7309d26-3161-4734-8495-0967e305fe8e/resourceGroups/api-demo/providers/Microsoft.Network/virtualNetworks/Linux-vm-vnet/subnets/aks-subnet"  
    availability_zones  = [1]  # Optional: for multi-zone setup
    enable_auto_scaling = false  # Optional: set to true for auto-scaling
  }

  tags = {
    environment = "dev"
  }
}
