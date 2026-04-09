# -------------------------------------------------
# Module to create AVM Resource Group
# -------------------------------------------------
module "avm-res-resources-resourcegroup-content" {
    source                            = "Azure/avm-res-resources-resourcegroup/azurerm"
    version                           = "0.2.1"
    name                              = local.resource_group_name_contentaggregation
    location                          = var.location
    tags                              = var.tags
}

# ------------------------------------------------------------
# Module to create AVM Azure SQL Database
# ------------------------------------------------------------
module "avm-res-sql-server-database-contentaggregation" {
    source                            = "Azure/avm-res-sql-server/azurerm//modules/database"
    version                           = "0.1.3"
    name                              = local.sql_database_name_contentaggregation
    tags                              = var.tags
    sql_server                        = { resource_id = module.avm-res-sql-server-shared.resource_id }    
    sku_name                          = local.sql_database_sku_name
    auto_pause_delay_in_minutes       = local.sql_database_auto_pause_delay_in_minutes
    collation                         = local.sql_database_collation
    create_mode                       = local.sql_database_create_mode
    ledger_enabled                    = false    
    max_size_gb                       = local.sql_database_max_size_gb
    min_capacity                      = local.sql_database_min_capacity
    read_replica_count                = local.sql_database_read_replica_count
    read_scale                        = false
    zone_redundant                    = false    
    storage_account_type            = local.storage_account_type
    short_term_retention_policy       = {
        retention_days                = local.sql_database_retention_days
        backup_interval_in_hours      = local.sql_database_backup_interval_in_hours
      }
}

# ------------------------------------------------------------
# AzApi - Notification Hub Namespace
# ------------------------------------------------------------
resource "azapi_resource" "notificationHubNameSpace" {
    type                              = "Microsoft.NotificationHubs/namespaces@2023-10-01-preview"
    parent_id                         = module.avm-res-resources-resourcegroup-content.resource_id
    name                              = local.notification_hub_ns_name_contentaggregation
    location                          = var.location
    tags                              = var.tags  
    body = {
            properties = {
                enabled               = true
                namespaceType         = "NotificationHub"      
            }
                sku = {
                name                  = "Free"
            }
    }
    schema_validation_enabled         = false
    response_export_values            = ["*"]
}

# ------------------------------------------------------------
# AzApi - Notification Hub
# ------------------------------------------------------------
resource "azapi_resource" "notificationHub" {
    type                              = "Microsoft.NotificationHubs/namespaces/notificationHubs@2023-10-01-preview"
    parent_id                         = azapi_resource.notificationHubNameSpace.id
    name                              = local.notification_hub_name_contentaggregation
    location                          = var.location
    tags                              = var.tags  
    body = {
            properties = {
                fcmV1Credential = {
                    properties = {
                        clientEmail   = var.sit_notification_hub_gcp_client_email
                        privateKey    = var.sit_notification_hub_gcp_private_key
                        projectId     = var.sit_notification_hub_gcp_project_id
                }
            }
        }
    }
    schema_validation_enabled         = false
    response_export_values            = ["*"]
}

# Set up endpoints locally, it didn't work on the locals.tf
locals {
  endpointsContent                    = toset(["blob"])
}

# -------------------------------------------------
# Module to create AVM Azure Storage account
# -------------------------------------------------
module "avm-res-storage-storageaccount-contentaggregation" {
  source                              = "Azure/avm-res-storage-storageaccount/azurerm"
  version                             = "0.5.0"
  name                                = local.storage_name_contentaggregation
  location                            = var.location
  tags                                = var.tags
  resource_group_name                 = module.avm-res-resources-resourcegroup-content.name
  account_replication_type            = local.storageaccount_account_replication_type
  account_tier                        = local.storageaccount_account_tier
  account_kind                        = local.storageaccount_account_kind
  https_traffic_only_enabled          = true
  min_tls_version                     = local.storageaccount_min_tls_version
  shared_access_key_enabled           = true
  public_network_access_enabled       = false
  default_to_oauth_authentication     = true

  # create container from given set of values
  containers = {
    for container in var.storage_containers_contentaggregation : container.name => {
      name                            = container.name
      container_access_type           = container.container_access_type
    }
  }
  
  # create a private endpoint for each endpoint type
  private_endpoints = {
    for endpoint in local.endpointsContent :
    endpoint => {
      # the name must be set to avoid conflicting resources.
      name                            = "pe-${endpoint}-${local.storage_name_contentaggregation}"
      subnet_resource_id              = var.sit_private_endpoint_subnet_id
      subresource_name                = endpoint      
      # these are optional but illustrate making well-aligned service connection & NIC names.
      private_service_connection_name = "psc-${endpoint}-${local.storage_name_contentaggregation}"
      network_interface_name          = "nic-pe-${endpoint}-${local.storage_name_contentaggregation}"
      inherit_lock                    = false
      location                        = var.location
      tags                            = var.tags
      private_dns_zone_resource_ids   = [var.private_dns_zone_ids_by_type[endpoint]]
    }
  }     
}
