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
  
}



# 6. Virtual Network address_space
variable "virtual_network_address_space" {
  description = "Virtual Network Address Space"
  type = list(string)
  default = [ "10.20.0.0/16","10.21.0.0/16","10.22.0.0/16" ]
  
}



# 5. Common Tags

variable "common_tags" {
  description = "Common Tags for Azure Resources"
  type = map(string)
  default = {
    "CLITool" = "Terraform",
    "Tag1" = "Azure"
  }
  
}

# 6. Azure MySQL DB Name (Variable Type: String)
variable "db_name" {
  description = "Azure MySQL Database DB Name"
  type = string  
  
}

# 7. Azure MySQL DB Username (Variable Type: Sensitive String)
variable "db_username" {
  description = "Azure MySQL Database Administrator Username"
  type = string  
  sensitive = true  
}

# 8. Azure MySQL DB Password (Variable Type: Sensitive String)
variable "db_password" {
  description = "Azure MySQL Database Administrator Password"
  type = string
  sensitive = true
  
}

# 9. Azure MySQL DB Storage in MB (Variable Type: Number)
variable "db_storage_mb" {
  description = "Azure MySQL Database Storage in MB"
  type = number
}

# 10. Azure MYSQL DB auto_grow_enabled (Variable Type: Boolean)

variable "db_auto_grow_enabled" {
  description = "Azure MySQL Database - Enable or Disable Auto Grow Feature"
  type = bool
  
}