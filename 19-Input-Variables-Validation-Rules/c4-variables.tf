# Input Variables
# 1. Business Unit Name

variable "Business_Unit" {
    description = "Business Unit Name"
    type = string 
}

# 2. Environment Name
variable "environment" {
    description = "Environment Name"
    type = string
}

# 3. Resource Group Name
variable "resource_group_name" {
    description = "Resource Group Name"
    type = string 
}

# 4. Resource Group Location
variable "resource_group_location" {
  description = "Resource Group Location"
  type = string
  default = "eastus"
  validation {
    condition = var.resource_group_location == "eastus" || var.resource_group_location == "eastus2"
    error_message = "We only allow Resources to be created in eastus or eastus2 Locations."
  }
}


# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string
}

# 6. Virtual Network address_space
variable "virtual_network_address_space" {
  description = "Virtual Network Address Space"
  type = list(string)
  default = [ "10.20.0.0/16","10.21.0.0/16","10.22.0.0/16" ]
  
}

# 7. Subnet Name: Assign When Prompted using CLI
variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type = string 
}

# 8. Public IP SKU

variable "public_ip_sku" {
  description = "Azure Public IP Address SKU"
  type = map(string)
  default = {
    "eastus" = "Basic",
    "eastus2" = "Standard"
  }
  
}

# 9. Common Tags

variable "common_tags" {
  description = "Common Tags for Azure Resources"
  type = map(string)
  default = {
    "CLITool" = "Terraform",
    "Tag1" = "Azure"
  }
  
}