resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = var.cluster_name
  kubernetes_version  = var.kubernetes_version

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "agents" {
  name                  = "agentpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.agent_vm_size
  node_count            = var.agent_node_count

  tags = {
    Role = "WorkflowAgents"
  }
}

resource "azurerm_user_assigned_identity" "agent" {
  name                = "${var.cluster_name}-agent-identity"
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
}

resource "azurerm_federated_identity_credential" "agent" {
  name                = "${var.cluster_name}-agent-federated-id"
  resource_group_name = azurerm_resource_group.aks.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.agent.id
  subject             = "system:serviceaccount:${var.agent_namespace}:${var.agent_service_account_name}"
}
