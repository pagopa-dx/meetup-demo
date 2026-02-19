terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  storage_use_azuread = true
  subscription_id     = "35e6e3b2-4388-470e-a1b9-ad3bc34326d1"
  alias               = "DEV-DEVEX"
}