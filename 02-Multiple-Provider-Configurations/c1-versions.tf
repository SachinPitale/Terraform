# We can use multiple provider in one terraform menifest.

# Why we used mutltiple provider.

# For example you have two region eastus and westus  where vm is running .
# when you perform delete opration that time eastus vm must be deleted  with disk but westus vm deleted without disk.


# Terraform Block
terraform {
    required_version = ">= 0.15"
    required_providers {
        azurerm = {
            source = "hasicorp/azurerm"
            version = ">= 2.0"
        }
    }
}

# Provider block 1 for east us
provider "azurerm" {
    features {}

}

provider "azurerm" {
    features {
        virtaul_machine {
            delete_os_disk_on_deletion  = false #  This will ensure when the Virtual Machine is destroyed, Disk is not deleted, default is true and we can alter it at provider level
        }
        alias = "provider2-westus"

    }

}