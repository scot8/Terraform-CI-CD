terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "truo0078-githubactions-rg"
    storage_account_name  = "truo0078githubactions"
    container_name        = "terraform-state"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "truo0078-githubactions-rg"
  location = "East US"
}
