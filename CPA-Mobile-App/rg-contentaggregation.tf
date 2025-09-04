# -------------------------------------------------
# Module to create AVM Resource Group
# -------------------------------------------------
module "avm-res-resources-resourcegroup-content" {
    source                          = "Azure/avm-res-resources-resourcegroup/azurerm"
    version                         = "0.2.1"
    name                            = local.resource_group_name_contentaggregation
    location                        = var.location
    tags                            = var.tags
}

# # ------------------------------------------------------------
# # AzApi - Notification Hub Namespace
# # ------------------------------------------------------------
# resource "azapi_resource" "notificationHubNameSpace" {
#     type                            = "Microsoft.NotificationHubs/namespaces@2023-10-01-preview"
#     parent_id                       = module.avm-res-resources-resourcegroup-content.resource_id
#     name                            = local.notification_hub_ns_name_contentaggregation
#     location                        = var.location
#     tags                            = var.tags  
#     body = {
#             properties = {
#                 enabled             = true
#                 namespaceType       = "NotificationHub"      
#             }
#                 sku = {
#                 name                = "Free"
#             }
#     }
#     schema_validation_enabled       = false
#     response_export_values          = ["*"]
# }

# # ------------------------------------------------------------
# # AzApi - Notification Hub
# # ------------------------------------------------------------
# resource "azapi_resource" "notificationHub" {
#     type                            = "Microsoft.NotificationHubs/namespaces/notificationHubs@2023-10-01-preview"
#     parent_id                       = azapi_resource.notificationHubNameSpace.id
#     name                            = local.notification_hub_name_contentaggregation
#     location                        = var.location
#     tags                            = var.tags  
#     body = {
#             properties = {
#                 fcmV1Credential = {
#                     properties = {
#                         clientEmail = var.sit_notification_hub_gcp_client_email
#                         privateKey  = var.sit_notification_hub_gcp_private_key
#                         projectId   = var.sit_notification_hub_gcp_project_id
#                 }
#             }
#         }
#     }
#     schema_validation_enabled       = false
#     response_export_values          = ["*"]
# }

# ------------------------------------------------------------
# Module to create AVM Azure SQL Database
# ------------------------------------------------------------
module "avm-res-sql-server-database-contentaggregation" {
    source                          = "Azure/avm-res-sql-server/azurerm//modules/database"
    version                         = "0.1.3"
    name                            = local.sql_database_name_contentaggregation
    tags                            = var.tags
    sql_server                      = { resource_id = module.avm-res-sql-server-shared.resource_id }    
    sku_name                        = "GP_Gen5_4" 
    # must not be serverless, it won't works with auto-pause disabled for this subscription
    # Estimated cost / month $799.93 AUD, must remove once testing is done
    auto_pause_delay_in_minutes     = null   # Set to null to disable auto-pausess
    collation                       = local.sql_database_collation
    create_mode                     = local.sql_database_create_mode
    ledger_enabled                  = false    
    max_size_gb                     = local.sql_database_max_size_gb
    min_capacity                    = local.sql_database_min_capacity
    read_replica_count              = local.sql_database_read_replica_count
    read_scale                      = false
    zone_redundant                  = false    
    short_term_retention_policy     = {
        retention_days              = local.sql_database_retention_days
        backup_interval_in_hours    = local.sql_database_backup_interval_in_hours
      }
}

# ------------------------------------------------------------
# Azurerm - Manages an Elastic Job Agent
# ------------------------------------------------------------
resource "azurerm_mssql_job_agent" "contentaggregation_job_agent" {
    name                            = local.sql_job_agent_name_contentaggregation
    location                        = var.location
    tags                            = var.tags
    database_id                     = module.avm-res-sql-server-database-contentaggregation.resource_id
}

# ------------------------------------------------------------
# Azurerm - Manages an Elastic Job Credential
# ------------------------------------------------------------
resource "azurerm_mssql_job_credential" "contentaggregation_job_agent_credential" {
  name                              = local.sql_job_agent_credential_name_contentaggregation
  job_agent_id                      = azurerm_mssql_job_agent.contentaggregation_job_agent.id
  username                          = var.sit_sql_admin_login
  password                          = var.sit_sql_admin_password 
}