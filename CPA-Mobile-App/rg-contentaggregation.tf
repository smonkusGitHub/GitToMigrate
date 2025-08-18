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
# # Module to create AVM Azure SQL Database
# # ------------------------------------------------------------
# module "avm-res-sql-server-database-contentaggregation" {
#     source                          = "Azure/avm-res-sql-server/azurerm//modules/database"
#     version                         = "0.1.3"
#     name                            = local.sql_database_name_contentaggregation
#     tags                            = var.tags
#     sql_server                      = { resource_id = module.avm-res-sql-server-shared.resource_id }    
#     sku_name                        = local.sql_database_sku_name
#     auto_pause_delay_in_minutes     = null   # Set to null to disable auto-pausess
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


resource "azapi_resource" "notificationHubNameSpace" {
  type                              = "Microsoft.NotificationHubs/namespaces@2023-10-01-preview"
  parent_id                         = module.avm-res-resources-resourcegroup-content.name
  name                              = local.notification_hub_ns_name_contentaggregation
  location                          = var.location
  tags                              = var.tags  
  body = {
        properties = {
            enabled                 = true
            namespaceType           = "NotificationHub"      
        }
            sku = {
            name                    = "Free"
        }
  }
  schema_validation_enabled         = false
  response_export_values            = ["*"]
}

resource "azapi_resource" "notificationHub" {
  type                              = "Microsoft.NotificationHubs/namespaces/notificationHubs@2023-10-01-preview"
  parent_id                         = azapi_resource.notificationHubNameSpace.id
  name                              = local.notification_hub_name_contentaggregation
  location  = var.location
body = {
    properties = {
        fcmV1Credential = {
        properties = {
          clientEmail               = local.notification_hub_gcp_client_email
          privateKey                = local.notification_hub_gcp_private_key
          projectId                 = local.notification_hub_gcp_project_id
        }
      }
    }
  }
  schema_validation_enabled         = false
  response_export_values            = ["*"]
}


# # ------------------------------------------------------------
# # Azurerm - Notification Hub Namespace
# # ------------------------------------------------------------
# resource "azurerm_notification_hub_namespace" "hub-ns1" {
#     name                            = local.notification_hub_ns_name_contentaggregation
#     resource_group_name             = module.avm-res-resources-resourcegroup-content.name
#     location                        = var.location
#     tags                            = var.tags
#     namespace_type                  = "NotificationHub"
#     sku_name                        = "Free"
# }

# # ------------------------------------------------------------
# # Azurerm - Notification Hub
# # ------------------------------------------------------------
# resource "azurerm_notification_hub" "hub1" {
#     name                            = local.notification_hub_name_contentaggregation
#     namespace_name                  = azurerm_notification_hub_namespace.hub-ns1.name
#     resource_group_name             = module.avm-res-resources-resourcegroup-content.name
#     location                        = var.location
#     tags                            = var.tags    
# }

# resource "azapi_resource" "hub_fcm_v1" {
#   type      = "Microsoft.NotificationHubs/namespaces/notificationHubs/fcmv1@2023-10-01-preview"
#   name      = "fcmv1"
#   parent_id = azurerm_notification_hub.hub1.id
#   schema_validation_enabled = false

#     body = {
#     properties = {
#       clientEmail = local.notification_hub_gcp_client_email
#       privateKey  = local.notification_hub_gcp_private_key
#       projectId   = local.notification_hub_gcp_project_id
#     }
#   }
# }


# # Apply Google FCM v1 Credentials
# resource "azapi_resource" "hub_fcm_v1" {
#   type                              = "Microsoft.NotificationHubs/namespaces/notificationHubs/fcmv1@2023-10-01-preview"
#   parent_id                         = azurerm_notification_hub.hub1.id
#   schema_validation_enabled         = false

#     body = {
#     properties = {
#                         projectId   = local.notification_hub_gcp_project_id
#                         privateKey  = local.notification_hub_gcp_private_key
#                         clientEmail = local.notification_hub_gcp_client_email
#     }
#   }
# }

# # ------------------------------------------------------------
# # Azurerm - Notification Hub Authorisation Rule
# # --------------------------------------- ---------------------
# # resource "azurerm_notification_hub_authorization_rule" "rule1" {
# #     name                            = local.notification_hub_rule1_contentaggregation    
# #     notification_hub_name           = azurerm_notification_hub.hub1.name
# #     namespace_name                  = azurerm_notification_hub_namespace.hub-ns1.name
# #     resource_group_name             = module.avm-res-resources-resourcegroup-content.name
# #     manage                          = true
# #     listen                          = true
# #     send                            = true
# # }

