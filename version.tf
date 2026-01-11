#versions.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "terrapro-789"
    storage_account_name = "terrapro7890"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}









