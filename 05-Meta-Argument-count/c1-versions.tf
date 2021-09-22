# Terraform Block
terraform {
  required_version = ">=1.0.0"
  required_provider {
      azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
  }
}

provider "azurerm" {
  features {}
}