variable "resource_group_name" {
  type        = string
  default     = "eastus"
  description = "Name of resource group"
}

variable "aks_name" {
  type        = string
  default     = "my-aks-cluster"
  description = "Name of AKS cluster"
}

variable "dns_prefix_name" {
  type        = string
  default     = "myakscluster"
  description = "DNS prefix specified when creating the managed cluster."
}

variable "kubernetes_version" {
  type        = string
  default     = "1.26.0"
  description = "Kubernetes version"
}

variable "node_pool_name" {
  type        = string
  default     = "default"
  description = "The name which should be used for the default Kubernetes Node Pool"
}

variable "node_pool_vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "The size of the Virtual Machine"
}

variable "node_count" {
  type        = number
  default     = 1
  description = "Number of nodes required in the node pool"
}

variable "subnet_id" {
  type        = string
  default     = "/subscriptions/e7309d26-3161-4734-8495-0967e305fe8e/resourceGroups/api-demo/providers/Microsoft.Network/virtualNetworks/aks-vnet/subnets/aks-subnet"
  description = "Subnet ID for the cluster"
}

variable "enable_auto_scaling" {
  type        = bool
  default     = false
  description = "Autoscaling enabled"
}

variable "service_principle_client_id" {
  type        = string
  description = "The Client ID for the Service Principal"
}

variable "service_principle_client_secret" {
  type        = string
  description = "The Client Secret for the Service Principal."
  sensitive = true
}
