# -------------------------------------------------
# Module to create AVM Resource Group
# -------------------------------------------------
module "avm-res-resources-resourcegroup-website" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.2.1"
  name     = local.resource_group_name_website
  location = var.location
  tags     = var.tags
}

