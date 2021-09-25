## Introduction
- Provide Input Variables using `<any-name>.tfvars` file with CLI 
argument `-var-file`

## Assign Input Variables with -var-file argument
- If we plan to use different names for  `.tfvars` files, then we need to explicitly provide the argument `-var-file` during the `terraform plan or apply`
- We will use following things in this example
- **terraform.tfvars:** All other common variables will be picked from this file and environment specific files will be picked from specific `env.tfvars` files
- **dev.tfvars:** `environment` and `resoure_group_location` variable will be picked from this file
- **qa.tfvars:** `environment` and `resoure_group_location` variable will be picked from this file

## Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan -var-file="dev.tfvars"


# Terraform Apply - Dev Environment
terraform apply -var-file="dev.tfvars"
```

## References
- [Terraform Input Variables](https://www.terraform.io/docs/language/values/variables.html)