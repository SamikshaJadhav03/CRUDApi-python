provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "aks" {
  name     = "api-demo"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = data.azurerm_resource_group.aks.name
  dns_prefix          = "myakscluster"
  kubernetes_version  = "1.21.0"

  default_node_pool {
    name                = "default"
    node_count          = 2
    vm_size             = "Standard_D2_v2"
    vnet_subnet_id      = "/subscriptions/e7309d26-3161-4734-8495-0967e305fe8e/resourceGroups/api-demo/providers/Microsoft.Network/virtualNetworks/Linux-vm-vnet/subnets/aks-subnet"  
    enable_auto_scaling = false  # Optional: set to true for auto-scaling
  }

  service_principal {
      client_id = "9cc3775c-5935-466e-8769-df1d4bcb32d2"
      client_secret = "QE18Q~JN.zLZXdjZOEy.SIS-CE6S2PkCa50GpaOe"
      }
  tags = {
    environment = "dev"
  }
}
