output "resource_group_name" {
  value = azurerm_resource_group.aks.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.aks.oidc_issuer_url
}

output "cluster_identity_principal_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "agent_identity_client_id" {
  value = azurerm_user_assigned_identity.agent.client_id
}

output "agent_identity_resource_id" {
  value = azurerm_user_assigned_identity.agent.id
}
