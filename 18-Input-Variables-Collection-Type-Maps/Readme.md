---
title: Terraform Input Variables with Collection Type maps
description: Terraform Input Variables with Collection Type maps
---
## Introduction
- Implement complex type constructors like `maps`
- Learn to use `lookup` function

## Implement complex type cosntructors like  `maps`
- [Type Constraints](https://www.terraform.io/docs/language/expressions/types.html)
- **map (or object):** a group of values identified by named labels, like {name = "Mabel", age = 52}.
- Implement Map function for variable `public_ip_sku` and `common_tags`
```t


##  Update c4-virtual-network.tf Public IP Resource
```t
# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                = "mypublicip-1"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${random_string.myrandom.id}"
  #sku = var.public_ip_sku["eastus"]
  sku = lookup(var.public_ip_sku, var.resoure_group_location)
  tags = var.common_tags
}
```



##  lookup() function
- [Terraform lookup function](https://www.terraform.io/docs/language/functions/lookup.html)
```t
# Terraform lookup() Function
lookup({a="ay", b="bee"}, "a", "what?")
lookup({a="ay", b="bee"}, "b", "what?")
lookup({a="ay", b="bee"}, "c", "what?")

# Terraform lookup() Function with our map
lookup({"eastus"="Basic", "eastus2"="Standard"},"eastus", "Basic")
lookup({"eastus"="Basic", "eastus2"="Standard"},"eastus2", "Basic")
lookup({"eastus"="Basic", "eastus2"="Standard"},"", "Basic")
```

## Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan 

# Terraform Apply
terraform apply -auto-approve

# Observation
1. Verify Public IP SKU should be "Standard"
2. Verify Tags for Resource Group, Vnet, Public IP and Network Interface
```

## Uncomment Public Resource below line
- Understand how to reference a specific value from a map
```t
## Uncomment
# Reference Specific value from Maps variable var.public_ip_sku
  sku = var.public_ip_sku["eastus"]

## Comment
  sku = lookup(var.public_ip_sku, var.resoure_group_location)  

# Terraform Plan
terraform plan

# Observation
1. Verify Public IP resource and SKU should be "Basic"
```

## Clean-Up
```t
# Destroy Resources
terraform destroy -auto-approve

# Delete files
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Important Notation about maps
- If the key starts with a number in a map `1-development`, you must use the colon syntax `:` instead of `=`
```t
variable "my_env_names" {
  type = map(string)
  default = {
    "1-development": "dev-apps"
    "2-staging": "staging-apps"
    "3-production": "prod-apps"
  }
}
```



## References
- [Terraform Input Variables](https://www.terraform.io/docs/language/values/variables.html)
