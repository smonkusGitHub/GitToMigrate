# ------------------------------------------------------------
# Config block that sets up the environment and requirements 
# to manage infrastructure—specifically for a 
# non-production mobile app project hosted in Azure and using Terraform Cloud.
# ------------------------------------------------------------
terraform {
  required_version = ">=1.7.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "> 4.5.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~>2.0"
    }
  }
  cloud {
    organization = "0"
    hostname     = "app.terraform.io"
    workspaces {
      project = "DevOps---CodeTest"
      name    = "DevOps - CodeTest"
    }
  }
}

# ------------------------------------------------------------
# Azure Resource Manager - gme-mobapp-nonprod-01
# ------------------------------------------------------------
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

# ------------------------------------------------------------
# Azure Resource Manager - CPA M&C
# ------------------------------------------------------------
provider "azurerm" {
  features {}
  alias           = "ampls"
  subscription_id = var.ampls_subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

# ------------------------------------------------------------
# Azure's REST API directly - gme-mobapp-nonprod-01
# ------------------------------------------------------------
provider "azapi" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

