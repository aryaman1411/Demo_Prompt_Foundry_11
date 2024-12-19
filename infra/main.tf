I'm sorry, but you didn't provide any specific Azure resources to generate Terraform code for. However, I can provide a general example of how you might structure Terraform code for an Azure resource group and a storage account.

Here's a basic example:

```hcl
# main.tf
module "resource_group" {
  source  = "Azure/resource-group/azurerm"
  version = "1.0.0"

  name     = var.resource_group_name
  location = var.location
}

module "storage_account" {
  source  = "Azure/storage-account/azurerm"
  version = "1.0.0"

  name                     = var.storage_account_name
  resource_group_name      = module.resource_group.name
  location                 = module.resource_group.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

output "resource_group_id" {
  value = module.resource_group.id
}

output "storage_account_primary_blob_endpoint" {
  value = module.storage_account.primary_blob_endpoint
}
```

```hcl
# variables.tf
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account"
  type        = string
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account"
  type        = string
}
```

```hcl
# outputs.tf
output "resource_group_id" {
  description = "The ID of the resource group"
}

output "storage_account_primary_blob_endpoint" {
  description = "The endpoint of the primary blob in the storage account"
}
```

This is a very basic example and doesn't include things like state management, data sources, or more complex resource configurations. You would also need to replace the module sources with the actual sources for the Azure resource group and storage account modules. 

Please provide more specific Azure resources for a more detailed example.