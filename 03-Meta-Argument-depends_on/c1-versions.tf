terraform {
  required_versions = ">= 0.15"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }  
  }  
}

provider "azurerm" {
  features { } 
}

# Random String Resource

resource "random_string" "myrandom" {
    length =  6
    upper = false
    special =  false
    number = false
}