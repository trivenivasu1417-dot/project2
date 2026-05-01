output "aks_id" {
  value = azurerm_kubernetes_cluster.AKS.id
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.AKS.name
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.AKS.kube_config_raw
  sensitive = true
}