terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.79.0"
    }
  }
   backend "azurerm" {
  resource_group_name  = "sit"
  storage_account_name = "sitterraformstate2026"
  container_name       = "tfstate"
  key                  = "sit.terraform.tfstate"
}
}

provider "azurerm" {
  features {}

  subscription_id = "6670366d-32db-4180-a842-1ce1053317b7"
}

provider "azurerm" {
  features {}
  subscription_id = "6670366d-32db-4180-a842-1ce1053317b7"
  alias           = "dev"
}

