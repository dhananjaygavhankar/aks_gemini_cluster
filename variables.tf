variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-aks-terraform"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
  default     = "East US"
}

variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
  default     = "aks-cluster-terraform"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.27"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
  default     = 2
}

variable "node_vm_size" {
  type        = string
  description = "Size of the VM for nodes"
  default     = "Standard_DS2_v2"
}

variable "agent_node_count" {
  type        = number
  description = "Number of nodes in the agent node pool"
  default     = 2
}

variable "agent_vm_size" {
  type        = string
  description = "Size of the VM for agent nodes"
  default     = "Standard_DS3_v2"
}

variable "agent_namespace" {
  type        = string
  description = "Kubernetes namespace for workflow agents"
  default     = "workflow-agents"
}

variable "agent_service_account_name" {
  type        = string
  description = "Service account name for workflow agents"
  default     = "agent-sa"
}
