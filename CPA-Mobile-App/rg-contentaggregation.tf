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
    # Cheapest supported SKU
    sku_name                        = "S1" 
    #sku_name                        = "GP_Gen5_4" 
    # must not be serverless, it won't works with auto-pause disabled for this subscription
    # Estimated cost / month $799.93 AUD, must remove once testing is done
    auto_pause_delay_in_minutes     = null   # Set to null to disable auto-pausess
    collation                       = "SQL_Latin1_General_CP1_CI_AS"
    create_mode                     = "Default"
    ledger_enabled                  = false    
    max_size_gb                     = 250
    read_replica_count              = 0
    read_scale                      = false
    zone_redundant                  = false    
    short_term_retention_policy     = {
        retention_days              = 7
        backup_interval_in_hours    = 12
      }
}

# # ------------------------------------------------------------
# # Azurerm - Manages an Elastic Job Agent
# # ------------------------------------------------------------
# resource "azurerm_mssql_job_agent" "contentaggregation_job_agent" {
#     name                            = local.sql_job_agent_name_contentaggregation
#     location                        = var.location
#     tags                            = var.tags
#     database_id                     = module.avm-res-sql-server-database-contentaggregation.resource_id
# }

# # ------------------------------------------------------------
# # Azurerm - Manages an Elastic Job Credential
# # ------------------------------------------------------------
# resource "azurerm_mssql_job_credential" "contentaggregation_job_agent_credential" {
#     name                            = local.sql_job_agent_credential_name_contentaggregation
#     job_agent_id                    = azurerm_mssql_job_agent.contentaggregation_job_agent.id
#     username                        = var.sit_sql_admin_login
#     password                        = var.sit_sql_admin_password 
# }

# # ------------------------------------------------------------
# # Azurerm - Manages a Job Target Group
# # ------------------------------------------------------------
# resource "azurerm_mssql_job_target_group" "contentaggregation_job_target_group" {
#     name                            = local.sql_job_target_group_name_contentaggregation
#     job_agent_id                    = azurerm_mssql_job_agent.contentaggregation_job_agent.id

#     job_target {
#         server_name                 = module.avm-res-sql-server-shared.resource_name
#         job_credential_id           = azurerm_mssql_job_credential.contentaggregation_job_agent_credential.id
#     }
# }

# # ------------------------------------------------------------
# # Azurerm - Manages an Elastic Job
# # ------------------------------------------------------------
# resource "azurerm_mssql_job" "contentaggregation_job" {
#     name                            = local.sql_job_name_contentaggregation
#     job_agent_id                    = azurerm_mssql_job_agent.contentaggregation_job_agent.id
#     description                     = "Contentaggregation Job - Clear unwanted Notification data"
# }

# # ------------------------------------------------------------
# # Azurerm - Manages an Elastic Job Step
# # ------------------------------------------------------------
# resource "azurerm_mssql_job_step" "contentaggregation_job_step1" {
#     name                            = local.sql_job_step1_name_contentaggregation
#     job_id                          = azurerm_mssql_job.contentaggregation_job.id
#     job_credential_id               = azurerm_mssql_job_credential.contentaggregation_job_agent_credential.id
#     job_target_group_id             = azurerm_mssql_job_target_group.contentaggregation_job_target_group.id
#     job_step_index                  = 1
#     sql_script                      = <<EOT
#                                         DELETE FROM MEMBER_LOGINS
#                                         WHERE MEMBER_ID IN (SELECT ml.MEMBER_ID
#                                                             FROM MEMBER_LOGINS ml
#                                                             GROUP BY ml.MEMBER_ID
#                                                             HAVING COUNT(*) > 20);
#                                         EOT
# }