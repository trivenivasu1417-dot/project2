resource "azurerm_kubernetes_cluster" "AKS" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

default_node_pool {
  name    = "default"
  vm_size = var.vm_size
  enable_auto_scaling = true
    node_count          = 1
    min_count           = 1
    max_count           = 3
}

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.2.0.0/16"
    dns_service_ip = "10.2.0.10"
  }
}