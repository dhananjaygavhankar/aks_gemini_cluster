terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    # These will be passed via backend-config or environment variables in GitHub Actions
  }
}

provider "azurerm" {
  features {}
}
