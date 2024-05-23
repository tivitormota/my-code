output "aks_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "aks id"
}

output "aks_identity" {
  value       = azurerm_kubernetes_cluster.aks.identity
  description = "aks identity"
}

output "aks_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "aks name"
}

output "aks_version" {
  value       = azurerm_kubernetes_cluster.aks.current_kubernetes_version
  description = "aks version"
}

output "aks_fqdn" {
  value       = azurerm_kubernetes_cluster.aks.fqdn
  description = "aks fqdn"
}

output "subnet" {
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.vnet_subnet_id
  description = "vnet subnet details"
}
