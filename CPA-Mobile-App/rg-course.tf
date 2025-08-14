# -------------------------------------------------
# Module to create AVM Resource Group
# -------------------------------------------------
module "avm-res-resources-resourcegroup-course" {
    source                          = "Azure/avm-res-resources-resourcegroup/azurerm"
    version                         = "0.2.1"
    name                            = local.resource_group_name_course
    location                        = var.location
    tags                            = var.tags
}

# # -------------------------------------------------
# # Module to create AVM Azure Storage account
# # -------------------------------------------------
# module "avm-res-storage-storageaccount-course" {
#   source                            = "Azure/avm-res-storage-storageaccount/azurerm"
#   version                           = "0.5.0"
#   name                              = local.storage_name_course
#   location                          = var.location
#   resource_group_name               = module.avm-res-resources-resourcegroup-course.name
#   account_replication_type          = local.storageaccount_account_replication_type
#   account_tier                      = local.storageaccount_account_tier
#   account_kind                      = local.storageaccount_account_kind
#   https_traffic_only_enabled        = true
#   min_tls_version                   = local.storageaccount_min_tls_version
#   shared_access_key_enabled         = true
#   public_network_access_enabled     = false
#   tags                              = var.tags
# }

# # ------------------------------------------------------------
# # Azurerm - Storage Containers
# # ------------------------------------------------------------
# resource "azurerm_storage_container" "containers-course" {
#   for_each                          = { for c in var.containers_course : c.name => c }
#   name                              = each.value.name
#   storage_account_id                = module.avm-res-storage-storageaccount-course.resource_id
#   container_access_type             = each.value.container_access_type
# }

# # ------------------------------------------------------------
# # Module to create AVM Azure SQL Database
# # ------------------------------------------------------------
# module "avm-res-sql-server-database-course" {
#     source                          = "Azure/avm-res-sql-server/azurerm//modules/database"
#     version                         = "0.1.3"
#     name                            = local.sql_database_name_course  
#     sql_server                      = { resource_id = module.avm-res-sql-server-shared.resource_id }    
#     tags                            = var.tags
#     sku_name                        = local.sql_database_sku_name
#     auto_pause_delay_in_minutes     = local.sql_database_auto_pause_delay_in_minutes
#     collation                       = local.sql_database_collation
#     create_mode                     = local.sql_database_create_mode
#     ledger_enabled                  = false    
#     max_size_gb                     = local.sql_database_max_size_gb
#     min_capacity                    = local.sql_database_min_capacity
#     read_replica_count              = local.sql_database_read_replica_count
#     read_scale                      = false
#     zone_redundant                  = false    
#     short_term_retention_policy     = {
#         retention_days              = local.sql_database_retention_days
#         backup_interval_in_hours    = local.sql_database_backup_interval_in_hours
#       }
# }

# # ------------------------------------------------------------
# # Azurerm - EventGrid System Topic
# # ------------------------------------------------------------
# resource "azurerm_eventgrid_system_topic" "eventgrid-system-topic-course" {
#   name                              = local.eventgrid_system_topic_name_course
#   resource_group_name               = module.avm-res-resources-resourcegroup-course.name
#   location                          = var.location
#   tags                              = var.tags
#   source_arm_resource_id            = module.avm-res-storage-storageaccount-course.resource_id
#   topic_type                        = "Microsoft.Storage.StorageAccounts"
# }

# # ------------------------------------------------------------
# # Azurerm - EventGrid System Topic Subscription
# # ------------------------------------------------------------
# resource "azurerm_eventgrid_system_topic_event_subscription" "eventgrid-system-topic-sub-course" {
#   name                              = local.eventgrid_system_event_sub_name_course
#   system_topic                      = azurerm_eventgrid_system_topic.eventgrid-system-topic-course.name
#   resource_group_name               = module.avm-res-resources-resourcegroup-course.name  
#   service_bus_topic_endpoint_id     = azurerm_servicebus_topic.shared_course_topic.id
#   included_event_types              = ["Microsoft.Storage.BlobCreated"]
# }

# # ------------------------------------------------------------
# # Azurerm - EventGrid Topic
# # ------------------------------------------------------------
# resource "azurerm_eventgrid_topic" "eventgrid-topic-course" {
#   name                              = local.eventgrid_topic_name_course
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-course.name  
#   local_auth_enabled                = false #CKV_AZURE_192 – "Ensure that Azure Event Grid Topic local Authentication is disabled"
#   identity {
#     type                            = "SystemAssigned" #CKV_AZURE_191: "Ensure that Managed identity provider is enabled for Azure Event Grid Topic"
#   }
#   public_network_access_enabled     = false #CKV_AZURE_193: "Ensure public network access is disabled for Azure Event Grid Topic"
# }

# # ------------------------------------------------------------
# # Azurerm - Private Endpoint (blob)
# # --------------------------------------- ---------------------
# module "avm-res-network-privateendpoint-st-course-blob" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_st_name_course_blob
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_st_name_course_blob
#     private_connection_resource_id  = module.avm-res-storage-storageaccount-course.resource_id
#     resource_group_name             = module.avm-res-resources-resourcegroup-course.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_st_name_course_blob
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_st_id_course_blob]
#     private_service_connection_name = local.private_service_connection_st_name_course_blob
#     subresource_names               = ["blob"]
# }

# # ------------------------------------------------------------
# # Azurerm - Private Endpoint (queue)
# # --------------------------------------- ---------------------
# module "avm-res-network-privateendpoint-st-course-queue" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_st_name_course_queue
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_st_name_course_queue
#     private_connection_resource_id  = module.avm-res-storage-storageaccount-course.resource_id
#     resource_group_name             = module.avm-res-resources-resourcegroup-course.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_st_name_course_queue
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_st_id_course_queue]
#     private_service_connection_name = local.private_service_connection_st_name_course_queue
#     subresource_names               = ["queue"]
# }

# # ------------------------------------------------------------
# # Azurerm - Private Endpoint (table)
# # --------------------------------------- ---------------------
# module "avm-res-network-privateendpoint-st-course-table" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_st_name_course_table
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_st_name_course_table
#     private_connection_resource_id  = module.avm-res-storage-storageaccount-course.resource_id
#     resource_group_name             = module.avm-res-resources-resourcegroup-course.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_st_name_course_table
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_st_id_course_table]
#     private_service_connection_name = local.private_service_connection_st_name_course_table
#     subresource_names               = ["table"]
# }