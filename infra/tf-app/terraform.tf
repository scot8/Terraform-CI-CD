terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # Azure Resource Manager provider and version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.3"
    }
  }

  backend "azurerm" {
    resource_group_name  = "scot0568-githubactions-rg"
    storage_account_name = "scot0568tfsa86431"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }
}
