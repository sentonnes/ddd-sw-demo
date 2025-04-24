terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.116.0"
    }
  }

  backend "azurerm" {
    container_name = "tfstate"
  }
}
