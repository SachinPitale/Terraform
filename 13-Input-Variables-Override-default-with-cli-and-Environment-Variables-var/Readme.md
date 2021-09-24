## Step-01: Generate Terraform Plan and use that using Terraform Apply
```t
# Option-2 (Generate plan file with -var and use that with apply)
# Generate Terraform plan file
terraform plan -var="resource_group_name=demorg" -var="resource_group_location=westus" -var="virtual_network_name=demovnet"  -out v1.plan


# Terraform Show
terraform show v1.plan

# Create / Deploy Terraform Resources using Plan file
terraform apply v1.plan 
```


## Step-02: Clean-Up Files
```t
# Destroy Resources
terraform destroy -auto-approve
Subnet Name: demosubnet (When Prompted)

# Delete Files
rm -rf .terraform*
rm -rf terraform.tfstate*
mv v1.plan v1.plan_bkup
```

## References
- [Terraform Input Variables](https://www.terraform.io/docs/language/values/variables.html)



## Step-03: Input Variables Override with Environment Variables
- Set environment variables and execute `terraform plan` to see if it overrides default values 
```t
# Sample
export TF_VAR_variable_name=value

# SET Environment Variables
export TF_VAR_resoure_group_name=rgenv
export TF_VAR_resoure_group_location=westus2
export TF_VAR_virtual_network_name=vnetenv
export TF_VAR_subnet_name=subnetenv
echo $TF_VAR_resoure_group_name, $TF_VAR_resoure_group_location, $TF_VAR_virtual_network_name, $TF_VAR_subnet_name
```


## Step-04: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan

# UNSET Environment Variables after demo
unset TF_VAR_resoure_group_name
unset TF_VAR_resoure_group_location
unset TF_VAR_virtual_network_name
unset TF_VAR_subnet_name
echo $TF_VAR_resoure_group_name, $TF_VAR_resoure_group_location, $TF_VAR_virtual_network_name, $TF_VAR_subnet_name
```

## Step-04: Clean-Up Files
```t
# Delete Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```


## References
- [Terraform Input Variables](https://www.terraform.io/docs/language/values/variables.html)
