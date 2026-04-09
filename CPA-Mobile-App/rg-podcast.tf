# -------------------------------------------------
# Module to create AVM Resource Group
# -------------------------------------------------
module "avm-res-resources-resourcegroup-podcast" {
    source                            = "Azure/avm-res-resources-resourcegroup/azurerm"
    version                           = "0.2.1"
    name                              = local.resource_group_name_podcast
    location                          = var.location
    tags                              = var.tags
}

# Set up endpoints locally, it didn't work on the locals.tf
locals {
  endpoints                           = toset(["blob", "queue", "table"])
}

# -------------------------------------------------
# Module to create AVM Azure Storage account
# -------------------------------------------------
module "avm-res-storage-storageaccount-podcast" {
  source                              = "Azure/avm-res-storage-storageaccount/azurerm"
  version                             = "0.5.0"
  name                                = local.storage_name_podcast
  location                            = var.location
  tags                                = var.tags
  resource_group_name                 = module.avm-res-resources-resourcegroup-podcast.name
  account_replication_type            = local.storageaccount_account_replication_type
  account_tier                        = local.storageaccount_account_tier
  account_kind                        = local.storageaccount_account_kind
  https_traffic_only_enabled          = true
  min_tls_version                     = local.storageaccount_min_tls_version
  shared_access_key_enabled           = true
  public_network_access_enabled       = false

  # create container from given set of values
  containers = {
    for container in var.storage_containers_podcast : container.name => {
      name                            = container.name
      container_access_type           = container.container_access_type
    }
  }

  # create queue from given set of values
  queues = {
    for queue in var.storage_queues_podcast : queue.name => {
      name                            = queue.name      
    }
  }
  
  # create table from given set of values
  tables = {
    for table in var.storage_tables_podcast : table.name => {
      name                            = table.name      
    }
  }

  # create a private endpoint for each endpoint type
  private_endpoints = {
    for endpoint in local.endpoints :
    endpoint => {
      # the name must be set to avoid conflicting resources.
      name                            = "pe-${endpoint}-${local.storage_name_podcast}"
      subnet_resource_id              = var.sit_private_endpoint_subnet_id
      subresource_name                = endpoint      
      # these are optional but illustrate making well-aligned service connection & NIC names.
      private_service_connection_name = "psc-${endpoint}-${local.storage_name_podcast}"
      network_interface_name          = "nic-pe-${endpoint}-${local.storage_name_podcast}"
      inherit_lock                    = false
      location                        = var.location
      tags                            = var.tags
      private_dns_zone_resource_ids   = [var.private_dns_zone_ids_by_type[endpoint]]
    }
  }     
}