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
}


# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string
}