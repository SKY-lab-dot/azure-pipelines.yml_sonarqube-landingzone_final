terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg_strg"
    storage_account_name = "strgfortfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = "5235c2c1-03cf-4091-87b8-e8adb1a1c5f6"
}
