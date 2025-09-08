# -------------------------------------------------
# Module to create AVM Resource Group
# -------------------------------------------------
module "avm-res-resources-resourcegroup-shared" {
    source                          = "Azure/avm-res-resources-resourcegroup/azurerm"
    version                         = "0.2.1"
    name                            = local.resource_group_name_shared
    location                        = var.location
    tags                            = var.tags
}

# # ------------------------------------------------------------
# # Azurerm - EventGrid Topic - Course
# # ------------------------------------------------------------
# resource "azurerm_eventgrid_topic" "eventgrid-topic-course-shared" {
#   name                              = local.eventgrid_topic_name_course_shared
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
#   local_auth_enabled                = false #CKV_AZURE_192 – "Ensure that Azure Event Grid Topic local Authentication is disabled"
#   identity {
#     type                            = "SystemAssigned" #CKV_AZURE_191: "Ensure that Managed identity provider is enabled for Azure Event Grid Topic"
#   }
#   public_network_access_enabled     = false #CKV_AZURE_193: "Ensure public network access is disabled for Azure Event Grid Topic"  
# }

# # ------------------------------------------------------------
# # Azurerm - EventGrid Topic - Podcast
# # ------------------------------------------------------------
# resource "azurerm_eventgrid_topic" "eventgrid-topic-podcast-shared" {
#   name                              = local.eventgrid_topic_name_podcast_shared
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
#   public_network_access_enabled     = false
#   local_auth_enabled                = false #CKV_AZURE_192 – "Ensure that Azure Event Grid Topic local Authentication is disabled"
#   identity {
#     type                            = "SystemAssigned" #CKV_AZURE_191: "Ensure that Managed identity provider is enabled for Azure Event Grid Topic"
#   }
# }

# # ------------------------------------------------------------
# # Azurerm - Event Hub Namespace
# # ------------------------------------------------------------
# resource "azurerm_eventhub_namespace" "eventhub-namspace-shared" {
#   name                              = local.eventhub_namespace_name_shared
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
#   sku                               = "Standard"
# }

# # ------------------------------------------------------------
# # Azurerm - Manages an Authorization Rule for an Event Hub Namespace
# # ------------------------------------------------------------
# resource "azurerm_eventhub_namespace_authorization_rule" "eventhub-namespace-auth-rule" {
#   name                              = local.eventhub_namespace_auth_rule_shared
#   namespace_name                    = azurerm_eventhub_namespace.eventhub-namspace-shared.name
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
#   listen                            = true
#   send                              = true
#   manage                            = true
# }

# # ------------------------------------------------------------
# # Azurerm - Event Hub
# # ------------------------------------------------------------
# resource "azurerm_eventhub" "eventhub" {
#   name                              = local.eventhub_name_shared
#   namespace_id                      = azurerm_eventhub_namespace.eventhub-namspace-shared.id
#   partition_count                   = 1
#   message_retention                 = 1

#   lifecycle {
#     ignore_changes = [
#       retention_description,
#     ]
#   }
# }

# # ------------------------------------------------------------
# # Azurerm - Event Hub Consumer Group
# # ------------------------------------------------------------
# resource "azurerm_eventhub_consumer_group" "eventhub-consumer-group" {
#   name                              = local.eventhub_consumer_group_name_shared
#   namespace_name                    = azurerm_eventhub_namespace.eventhub-namspace-shared.name
#   eventhub_name                     = azurerm_eventhub.eventhub.name
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
# }

# # ------------------------------------------------------------
# # Azurerm - Redis Cache
# # ------------------------------------------------------------
# resource "azurerm_redis_cache" "redis-cahce-shared" {
#   name                              = local.redis_cache_name_shared
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
#   public_network_access_enabled     = false
#   redis_version                     = 6
#   capacity                          = 1
#   family                            = "C"
#   sku_name                          = "Standard"
#   minimum_tls_version               = "1.2" #CKV_AZURE_148: "Ensure Redis Cache is using the latest version of TLS encryption"
# }


# # -------------------------------------------------
# # Module to create AVM Key Vault
# # -------------------------------------------------
# module "avm-res-keyvault-vault-shared" {
#   source  = "Azure/avm-res-keyvault-vault/azurerm"
#   version = "0.10.0"
#   name                              = local.keyvault_name_shared
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
#   public_network_access_enabled     = false
#   sku_name                          = "standard"
#   tenant_id                         = var.tenant_id
# }

# # -------------------------------------------------
# # Azurem to create SignalR
# # -------------------------------------------------
# resource "azurerm_signalr_service" "signalrshared" {
#   name                              = local.signalr_name_shared
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  

#   sku {
#     name     = "Standard_S1"
#     capacity = 1
#   }
  
#   public_network_access_enabled     = false
#   service_mode                      = "Serverless"
#   connectivity_logs_enabled         = true
#   messaging_logs_enabled            = true
# }

# # -------------------------------------------------
# # AzureRM to create Log Analytics workspace
# # -------------------------------------------------
# resource "azurerm_log_analytics_workspace" "workspace_shared" {
#   name                              = local.log_analytics_workspace_name_shared
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
#   sku                               = "PerGB2018"
#   retention_in_days                 = 30
#   internet_ingestion_enabled        = false
#   internet_query_enabled            = false
# }

# # -------------------------------------------------
# # AzureRM to Manages an Azure Monitor Private Link Scoped Service for workspace.
# # -------------------------------------------------
# resource "azurerm_monitor_private_link_scoped_service" "wslink_scoped" {
#   name                              = local.wsmonitor_link_name_shared
#   resource_group_name               = local.monitor_link_resource_group_shared
#   scope_name                        = local.monitor_link_scope_name_shared
#   linked_resource_id                = azurerm_log_analytics_workspace.workspace_shared.id
#   provider                          = azurerm.ampls
# }

# # -------------------------------------------------
# # Azure automatically creates a Smart Detection Action Group when Application Insights is provisioned, 
# # but does not expose it directly through Terraform or standard API enumeration easily. That means:
# # You can’t automatically reference it in Terraform without some workaround 
# # so I moved away from AVM and goes to use AzureRM instead.
# # -------------------------------------------------
# # AzureRM to create Application Insight
# # -------------------------------------------------
# resource "azurerm_application_insights" "ai_shared" {
#   name                              = local.application_insight_name_shared
#   location                          = var.location
#   tags                              = var.tags  
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
#   workspace_id                      = azurerm_log_analytics_workspace.workspace_shared.id
#   application_type                  = "web"
#   internet_ingestion_enabled        = false
#   internet_query_enabled            = false
#   daily_data_cap_in_gb              = "5"
  
#   }

# # -------------------------------------------------
# # AzureRM to Manages an Azure Monitor Private Link Scoped Service.
# # -------------------------------------------------
# resource "azurerm_monitor_private_link_scoped_service" "link_scoped" {
#   name                              = local.monitor_link_name_shared
#   resource_group_name               = local.monitor_link_resource_group_shared
#   scope_name                        = local.monitor_link_scope_name_shared
#   linked_resource_id                = azurerm_application_insights.ai_shared.id
#   provider                          = azurerm.ampls
# }

# # -------------------------------------------------
# # AzureRM to create Monitor Action Group
# # -------------------------------------------------
# resource "azurerm_monitor_action_group" "action_group_shared" {
#   name                              = local.actiongroup_name_shared
#   location                          = "global"
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
#   short_name                        = "SmartDetect"
# }

# # -------------------------------------------------
# # AzureRM to create resource provider registration of a Resource Provider 
# # - which allows access to the API's supported by this Resource Provider.
# # -------------------------------------------------
# resource "azurerm_resource_provider_registration" "alerts_management" {
#   name = "Microsoft.AlertsManagement"
# }

# # # -------------------------------------------------
# # # AzureRM to create monitor smart detector alert rule
# # # - which Manages an Monitor Smart Detector Alert Rule.
# # # -------------------------------------------------
# # resource "azurerm_monitor_smart_detector_alert_rule" "alert_rule01_shared" {
# #   name                              = local.alert_rule01_name_shared
# #   tags                              = var.tags
# #   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name  
# #   severity                          = "Sev3"
# #   scope_resource_ids                = [azurerm_application_insights.ai_shared.id]
# #   frequency                         = "PT1M"
# #   detector_type                     = "FailureAnomaliesDetector"
# #   description                       = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
# #   action_group {
# #         ids                         = [azurerm_monitor_action_group.action_group_shared.id]
# #   }
# # }

# #-------------------------------------------------
# # Azurerm - Private Endpoint (RedisCache1)
# # -------------------------------------------------
# module "avm-res-network-privateendpoint-rediscache1" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_redis_name1_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_redis_name1_shared
#     private_connection_resource_id  = azurerm_redis_cache.redis-cahce-shared.id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_redis_name1_shared
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_redis_id1_shared]
#     private_service_connection_name = local.private_service_connection_redis_name1_shared
#     subresource_names               = ["redisCache"]
# }

# #-------------------------------------------------
# # Azurerm - Private Endpoint (RedisCache2)
# # -------------------------------------------------
# module "avm-res-network-privateendpoint-rediscache2" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_redis_name2_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_redis_name2_shared
#     private_connection_resource_id  = azurerm_redis_cache.redis-cahce-shared.id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_service_connection_name = local.private_service_connection_redis_name2_shared
#     subresource_names               = ["redisCache"]
# }

# #-------------------------------------------------
# # Azurerm - Private Endpoint (signalr)
# # -------------------------------------------------
# module "avm-res-network-privateendpoint-signalr" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_signalr_name_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_signalr_name_shared
#     private_connection_resource_id  = azurerm_signalr_service.signalrshared.id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_service_connection_name = local.private_service_connection_signalr_name_shared
#     subresource_names               = ["signalr"]
# }

# # -------------------------------------------------
# # Azurerm - Private Endpoint (KeyVault)
# # -------------------------------------------------
# module "avm-res-network-privateendpoint-keyvault-shared" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_keyvault_name_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_keyvault_name_shared
#     private_connection_resource_id  = module.avm-res-keyvault-vault-shared.resource_id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name  
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_keyvault_name_shared
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_keyvault_id_shared]
#     private_service_connection_name = local.private_service_connection_keyvault_name_shared
#     subresource_names               = ["vault"]
# }

# #-------------------------------------------------
# # Azurerm - Private Endpoint (Event Grid NS - Topic Course1)
# # -------------------------------------------------
# module "avm-res-network-privateendpoint-eventgrid-topic-course" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_egt_course_name_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_egt_course_name_shared
#     private_connection_resource_id  = azurerm_eventgrid_topic.eventgrid-topic-course-shared.id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_service_connection_name = local.private_service_connection_egt_course_name_shared
#     subresource_names               = ["topic"]
# }

# #-------------------------------------------------
# # Azurerm - Private Endpoint (Eventgrid Topic - Podcast)
# # -------------------------------------------------
# module "avm-res-network-privateendpoint-eventgrid-topic-podcast" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_egt_podcast_name_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_egt_podcast_name_shared
#     private_connection_resource_id  = azurerm_eventgrid_topic.eventgrid-topic-podcast-shared.id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_service_connection_name = local.private_service_connection_egt_podcast_name_shared
#     subresource_names               = ["topic"]
# }

# # -------------------------------------------------
# # Module to create AVM Azure Service Bus
# # -------------------------------------------------
# module "avm-res-servicebus-namespace-shared" {
#   source                            = "Azure/avm-res-servicebus-namespace/azurerm"
#   version                           = "0.4.0"
#   name                              = local.servicebus_namespace_name_shared
#   location                          = var.location
#   tags                              = var.tags
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
#   authorization_rules               = var.authorization_rules_shared_course
#   sku                               = local.servicebus_sku
#   capacity                          = local.servicebus_capacity
#   premium_messaging_partitions      = local.servicebus_premium_messaging_partitions
#   public_network_access_enabled     = false
# }

# # ------------------------------------------------------------
# # Azurerm - Service Bus Topic
# # ------------------------------------------------------------
# resource "azurerm_servicebus_topic" "shared_course_topic" {
#   name                              = local.servicebus_topic_name_shared_course
#   namespace_id                      = module.avm-res-servicebus-namespace-shared.resource_id
#   default_message_ttl               = "P14D"
#   batched_operations_enabled        = true
# }

# # ------------------------------------------------------------
# # Azurerm - Service Bus Queue
# # ------------------------------------------------------------
# resource "azurerm_servicebus_queue" "shared_podcast_queue" {
#   name                              = local.servicebus_queue_name_shared_queue
#   namespace_id                      = module.avm-res-servicebus-namespace-shared.resource_id
#   default_message_ttl               = "P14D"
#   partitioning_enabled              = false  
#   max_delivery_count                = 10
#   batched_operations_enabled        = true
#   max_size_in_megabytes             = 1024
#   max_message_size_in_kilobytes     = 102400
#   dead_lettering_on_message_expiration = true  
# }

# # ------------------------------------------------------------
# # Azurerm - Service Bus Subscription
# # ------------------------------------------------------------
# resource "azurerm_servicebus_subscription" "shared_course_subscription" {
#   name                                      = local.servicebus_subscription_name_shared_course
#   topic_id                                  = azurerm_servicebus_topic.shared_course_topic.id
#   auto_delete_on_idle                       = "P10675198DT2H48M5S"
#   batched_operations_enabled                = true
#   dead_lettering_on_filter_evaluation_error = false
#   default_message_ttl                       = "P14D"
#   max_delivery_count                        = 10
# }

# # ------------------------------------------------------------
# # Azurerm - Service Bus Subscription Rule
# # ------------------------------------------------------------
# resource "azurerm_servicebus_subscription_rule" "shared_course_rule" {
#   name                              = local.servicebus_subscription_rule_name_shared_course
#   subscription_id                   = azurerm_servicebus_subscription.shared_course_subscription.id
#   filter_type                       = "SqlFilter"
#   sql_filter                        = "1=1"
# }

# # ------------------------------------------------------------
# # Azurerm - Private Endpoint (Service Bus)
# # --------------------------------------- ---------------------
# module "avm-res-network-privateendpoint-sb-course" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_sb_name_shared_course
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_sb_name_shared_course
#     private_connection_resource_id  = module.avm-res-servicebus-namespace-shared.resource_id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_sb_name_shared_course
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_sb_id_shared_course]
#     private_service_connection_name = local.private_service_connection_sb_name_shared_course
#     subresource_names               = ["namespace"]
# }

# ------------------------------------------------------------
# Module to create AVM Azure SQL Server
# ------------------------------------------------------------
module "avm-res-sql-server-shared" {
    source                          = "Azure/avm-res-sql-server/azurerm"
    version                         = "0.1.5"
    server_version                  = "12.0"    
    resource_group_name             = module.avm-res-resources-resourcegroup-shared.name
    name                            = local.sql_server_name_shared
    location                        = var.location
    tags                            = var.tags
    connection_policy               = "Proxy"
    public_network_access_enabled   = false    
    administrator_login             = var.sit_sql_admin_login
    administrator_login_password    = var.sit_sql_admin_password 
    azuread_administrator           = {
        login_username              = local.sql_server_azuread_administrator_name
        object_id                   = local.sql_server_azuread_administrator_id
  }
  express_vulnerability_assessment_enabled = true
}

# # ------------------------------------------------------------
# # Azurerm - Private Endpoint (SQL Server)
# # ------------------------------------------------------------
# module "avm-res-network-privateendpoint-sql-shared" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_sql_name_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_sql_name_shared
#     private_connection_resource_id  = module.avm-res-sql-server-shared.resource_id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name  
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_sql_name_shared
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_sql_id_shared]
#     private_service_connection_name = local.private_service_connection_sql_name_shared
#     subresource_names               = ["sqlServer"]
# }

# # ------------------------------------------------------------
# # Azurerm - Manages a CosmosDB (formally DocumentDB) Account.
# # ------------------------------------------------------------
# resource "azurerm_cosmosdb_account" "shared_cosmos" {
#   name                              = local.cosmosdb_name_shared
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
#   location                          = var.location
#   tags                              = var.tags
#   offer_type                        = local.cosmosdb_offer_type_shared
#   kind                              = local.cosmosdb_kind_shared
#   public_network_access_enabled     = false  
#   is_virtual_network_filter_enabled = true #allows Cosmos DB access only from selected subnets, further hardening the management plane.
#   automatic_failover_enabled        = true
#   multiple_write_locations_enabled  = true
#   free_tier_enabled                 = false
#   local_authentication_disabled     = false #CKV_AZURE_140: "Ensure that Local Authentication is disabled on CosmosDB"
#   analytical_storage_enabled        = true
#   consistency_policy {
#     consistency_level               = local.cosmosdb_consistency_level_shared
#     max_interval_in_seconds         = local.cosmosdb_consistency_level_min_shared
#     max_staleness_prefix            = local.cosmosdb_consistency_level_max_shared
#   }

#   geo_location {
#     location                        = var.location
#     failover_priority               = 0
#     zone_redundant                  = true
#   }

#   backup {
#     type                            = local.cosmosdb_backup_type_shared
#     interval_in_minutes             = local.cosmosdb_backup_interval_in_minutes_shared
#     retention_in_hours              = local.cosmosdb_backup_retention_in_hours_shared
#     storage_redundancy              = local.cosmosdb_backup_storage_redundancy_shared
#   }
# }

# # ------------------------------------------------------------
# # Azurerm - Manages the Pricing Tier for Azure Security Center in the current subscription.
# # CKV_AZURE_132: "Ensure cosmosdb does not allow privileged escalation by restricting management plane changes"
# # ------------------------------------------------------------
# resource "azurerm_security_center_subscription_pricing" "cosmosdb_defender" {
#   tier                              = local.cosmosdb_defender_tier_shared
#   resource_type                     = local.cosmosdb_defender_resource_type_shared
# }

# # ------------------------------------------------------------
# # Azurerm - Manages a Diagnostic Setting for an existing Resource.
# # CKV_AZURE_132: "Ensure cosmosdb does not allow privileged escalation by restricting management plane changes"
# # ------------------------------------------------------------
# resource "azurerm_monitor_diagnostic_setting" "cosmosdb_diagnostics" {
#   name                              = local.cosmosdb_diagnostics_name_shared
#   target_resource_id                = azurerm_cosmosdb_account.shared_cosmos.id
#   log_analytics_workspace_id        = azurerm_log_analytics_workspace.workspace_shared.id

#   enabled_log {
#     category = "DataPlaneRequests"
#   }

#   enabled_log {
#     category = "QueryRuntimeStatistics"
#   }

#   enabled_log {
#     category = "PartitionKeyStatistics"
#   }

#   enabled_metric {
#     category = "AllMetrics"
#   }
  
#   lifecycle {
#     ignore_changes = [
#       enabled_metric,
#     ]
#   }
# }

# # ------------------------------------------------------------
# # Azurerm - Manages a SQL Database within a Cosmos DB Account.
# # ------------------------------------------------------------
# resource "azurerm_cosmosdb_sql_database" "shared_cosmos_sql_db" {
#   name                              = local.cosmosdb_sql_database_mobile_name_shared
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
#   account_name                      = azurerm_cosmosdb_account.shared_cosmos.name
# }

# # ------------------------------------------------------------
# # Azurerm - Manages a SQL Container within a Cosmos DB Account.
# # ------------------------------------------------------------
# resource "azurerm_cosmosdb_sql_container" "shared_cosmos_sql_container" {
#   name                              = local.cosmosdb_sql_container_notifications_name_shared
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
#   account_name                      = azurerm_cosmosdb_account.shared_cosmos.name
#   database_name                     = azurerm_cosmosdb_sql_database.shared_cosmos_sql_db.name
#   partition_key_paths               = [local.cosmosdb_sql_container_partition_key_paths_shared]

#   default_ttl                       = 3888000 # 45 days in seconds

#   indexing_policy {
#     indexing_mode                   = local.cosmosdb_sql_container_indexing_mode_shared    
#     included_path {
#       path                          = local.cosmosdb_sql_container_included_path_shared
#     }
#     # excluded_path {
#     #   path                          = local.cosmosdb_sql_container_excluded_path_shared
#     # }
#   }

#   autoscale_settings {
#     max_throughput                  = local.cosmosdb_sql_container_autoscale_max_shared
#   }

#   # (Optional) A conflict_resolution_policy blocks as defined below. Changing this forces a new resource to be created.
#   conflict_resolution_policy {
#     mode                            = local.cosmosdb_sql_container_conflict_res_mode_shared
#     conflict_resolution_path        = local.cosmosdb_sql_container_conflict_res_path_shared
#   }
# }

# # ------------------------------------------------------------
# # Azurerm - Manages a Cosmos DB SQL Role Definition. (SQL Reader)
# # ------------------------------------------------------------
# # az cosmosdb sql role definition list --account-name cos-db-tst-ae-01-shared --resource-group rg-ae-tst-mobileapp-shared-01 --query "[].permissions[].dataActions[]" -o table
# resource "azurerm_cosmosdb_sql_role_definition" "shared_cosmos_sql_data_reader" {
#   name                              = local.cosmosdb_sql_role_data_reader_shared
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
#   account_name                      = azurerm_cosmosdb_account.shared_cosmos.name
#   assignable_scopes                 = [azurerm_cosmosdb_account.shared_cosmos.id]
#   type                              = local.cosmosdb_sql_role_type_shared

#    permissions {
#     data_actions = [
#       "Microsoft.DocumentDB/databaseAccounts/readMetadata",
#       "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/executeQuery",
#       "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/read",
#       "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/readChangeFeed"
#     ]
#   }  
# }

# # ------------------------------------------------------------
# # Azurerm - Manages a Cosmos DB SQL Role Definition. (SQL Contributor)
# # ------------------------------------------------------------
# resource "azurerm_cosmosdb_sql_role_definition" "shared_cosmos_sql_data_contributor" {
#   name                              = local.cosmosdb_sql_role_data_contributor_shared
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
#   account_name                      = azurerm_cosmosdb_account.shared_cosmos.name
#   assignable_scopes                 = [azurerm_cosmosdb_account.shared_cosmos.id]
#   type                              = local.cosmosdb_sql_role_type_shared

#    permissions {
#     data_actions = [
#       "Microsoft.DocumentDB/databaseAccounts/readMetadata",
#       "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*",
#       "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*"
#     ]
#   }  
# }

# # ------------------------------------------------------------
# # AzApi - Manages a Cosmos DB Table Role Definition. (Table Reader)
# # Doc : https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/Microsoft.DocumentDB_databaseAccounts_sqlRoleDefinitions
# # id=/subscriptions/620dd0e0-7ba9-4b1a-a5b4-98c114b9e642/resourceGroups/rg-ae-tst-mobileapp-shared-01/providers/Microsoft.DocumentDB/databaseAccounts/cos-db-tst-ae-01-shared/tableRoleDefinitions/72e91379-ea85-5894-41ef-41290308593d
# # ------------------------------------------------------------
# resource "azapi_resource" "shared_cosmos_table_data_reader" {
#   provider = azapi

#   # Define the correct resource type with API version
#   type      = "Microsoft.DocumentDB/databaseAccounts/tableRoleDefinitions@2025-05-01-preview"
#   parent_id = azurerm_cosmosdb_account.shared_cosmos.id
#   #name      = uuid()  # Dynamically generate a GUID for the name
#   name      = local.cosmosdb_table_role_data_reader_name_shared

#   body = {
#     properties = {
#       assignableScopes = [
#         azurerm_cosmosdb_account.shared_cosmos.id,
#       ]
#       permissions = [
#         {
#           dataActions = [
#             "Microsoft.DocumentDB/databaseAccounts/readMetadata",
#             "Microsoft.DocumentDB/databaseAccounts/tables/containers/executeQuery",
#             "Microsoft.DocumentDB/databaseAccounts/tables/containers/entities/read",
#             "Microsoft.DocumentDB/databaseAccounts/tables/containers/readChangeFeed",
#           ]
#         },
#       ]
#       roleName = local.cosmosdb_table_role_data_reader_shared
#       type     = local.cosmosdb_sql_role_type_shared
#     }
#   }
#   schema_validation_enabled = false
#   response_export_values    = ["*"]

#   lifecycle {
#     ignore_changes = [
#       body,
#     ]
#   }
# }

# # ------------------------------------------------------------
# # Azurerm - Manages a Cosmos DB Table Role Definition. (Table Contributor)
# # ------------------------------------------------------------
# resource "azapi_resource" "shared_cosmos_table_data_contributor" {
#   provider = azapi

#   # Define the correct resource type with API version
#   type      = "Microsoft.DocumentDB/databaseAccounts/tableRoleDefinitions@2025-05-01-preview"
#   parent_id = azurerm_cosmosdb_account.shared_cosmos.id
#   #name      = uuid()  # Dynamically generate a GUID for the name
#   name      = local.cosmosdb_table_role_data_contributor_name_shared

#   body = {
#     properties = {
#       assignableScopes = [
#         azurerm_cosmosdb_account.shared_cosmos.id,
#       ]
#       permissions = [
#         {
#           dataActions = [
#             "Microsoft.DocumentDB/databaseAccounts/readMetadata",
#             "Microsoft.DocumentDB/databaseAccounts/tables/*",
#             "Microsoft.DocumentDB/databaseAccounts/tables/containers/*",
#             "Microsoft.DocumentDB/databaseAccounts/tables/containers/entities/*",
#           ]
#         },
#       ]
#       roleName = local.cosmosdb_table_role_data_contributor_shared
#       type     = local.cosmosdb_sql_role_type_shared
#     }
#   }
#   schema_validation_enabled = false
#   response_export_values    = ["*"]

#   lifecycle {
#     ignore_changes = [
#       body,
#     ]
#   }
# }

# # ------------------------------------------------------------
# # Azurerm - Private Endpoint (Cosmos DB)
# # ------------------------------------------------------------
# module "avm-res-network-privateendpoint-cosmosdb-sql-shared" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_cosmodb_sql_name_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_cosmodb_sql_name_shared
#     private_connection_resource_id  = azurerm_cosmosdb_account.shared_cosmos.id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name  
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_cosmodb_sql_name_shared
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_cosmodb_sql_id_shared]
#     private_service_connection_name = local.private_service_connection_cosmodb_sql_name_shared
#     subresource_names               = ["Sql"]
# }


# # ------------------------------------------------------------
# # Azurerm - Manages an Azure App Configuration.
# # ------------------------------------------------------------
# resource "azurerm_app_configuration" "appconfig_shared" {
#   name                              = local.appconfig_name_shared
#   resource_group_name               = module.avm-res-resources-resourcegroup-shared.name
#   location                          = var.location
#   tags                              = var.tags
#   sku                               = "standard"
#   local_auth_enabled                = false
#   public_network_access             = "Disabled"
#   purge_protection_enabled          = true
#   soft_delete_retention_days        = 7  
# }

# # -------------------------------------------------
# # AVM - Private Endpoint (App Configuration)
# # -------------------------------------------------
# module "avm-res-network-privateendpoint-appconfig-shared" {
#     source                          = "Azure/avm-res-network-privateendpoint/azurerm"
#     version                         = "0.2.0"
#     name                            = local.private_endpoint_appconfig_name_shared
#     location                        = var.location
#     tags                            = var.tags
#     network_interface_name          = local.private_network_interface_appconfig_name_shared
#     private_connection_resource_id  = azurerm_app_configuration.appconfig_shared.id
#     resource_group_name             = module.avm-res-resources-resourcegroup-shared.name  
#     subnet_resource_id              = var.sit_private_endpoint_subnet_id
#     private_dns_zone_group_name     = local.private_dns_zone_group_appconfig_name_shared
#     private_dns_zone_resource_ids   = [local.private_dns_zone_resource_appconfig_id_shared]
#     private_service_connection_name = local.private_service_connection_appconfig_name_shared
#     subresource_names               = ["configurationStores"]
# }

# ------------------------------------------------------------
# Azurerm - Manages a User Assigned Identity
# ------------------------------------------------------------
resource "azurerm_user_assigned_identity" "sql_job_agent_identity" {
  name                            = "umi-sql-job-agent"
  location                        = var.location
  tags                            = var.tags
  resource_group_name             = module.avm-res-resources-resourcegroup-shared.name
}

# ------------------------------------------------------------
# Module to create AVM Azure SQL Database (JobDB)
# ------------------------------------------------------------
module "avm-res-sql-server-database-jobdb" {
    source                          = "Azure/avm-res-sql-server/azurerm//modules/database"
    version                         = "0.1.3"
    name                            = local.sql_database_name_jobdb
    tags                            = var.tags
    sql_server                      = { resource_id = module.avm-res-sql-server-shared.resource_id }
    # Cheapest supported SKU
    # Standard (S1) Cost per DTU (in AUD) 2.40 DTUs selected x 20 Estimated cost / month 48.06 AUD
    sku_name                        = local.sql_database_jobdb_sku_name
    auto_pause_delay_in_minutes     = null   # Set to null to disable auto-pausess
    collation                       = local.sql_database_collation
    create_mode                     = local.sql_database_create_mode
    ledger_enabled                  = false    
    max_size_gb                     = local.sql_database_jobdb_max_size_gb
    read_replica_count              = local.sql_database_read_replica_count
    read_scale                      = false
    zone_redundant                  = false    
    short_term_retention_policy     = {
        retention_days              = local.sql_database_retention_days
        backup_interval_in_hours    = local.sql_database_backup_interval_in_hours
      }
}

# ------------------------------------------------------------
# Azurerm - Manages an Elastic Job Agent (JobDB)
# ------------------------------------------------------------
resource "azurerm_mssql_job_agent" "sql_job_agent" {
    name                            = local.sql_job_agent_name_jobdb
    location                        = var.location
    tags                            = var.tags
    database_id                     = module.avm-res-sql-server-database-jobdb.resource_id

    identity {
    type                            = "UserAssigned"
    identity_ids                    = [azurerm_user_assigned_identity.sql_job_agent_identity.id]
  }
}

# ------------------------------------------------------------
# Azurerm - Manages a Job Target Group
# ------------------------------------------------------------
resource "azurerm_mssql_job_target_group" "job_target_group_server" {
    name                            = local.sql_job_target_group_name_jobdb
    job_agent_id                    = azurerm_mssql_job_agent.sql_job_agent.id
    job_target {
        server_name                 = module.avm-res-sql-server-shared.resource_name
        membership_type             = "Include"
        #job_credential_id           = azurerm_user_assigned_identity.sql_job_agent_identity.id
    }
}

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

# ------------------------------------------------------------
# Azurerm - Manages an Elastic Job Credential (JobDB)
# ------------------------------------------------------------
# resource "azurerm_mssql_job_credential" "contentaggregation_job_agent_credential" {
#     name                            = local.sql_job_agent_credential_name_jobdb
#     job_agent_id                    = azurerm_mssql_job_agent.sql_job_agent.id
#     identity_id      = azurerm_user_assigned_identity.sql_job_agent_identity.id
#     credential_type  = "UserAssignedIdentity"
# }

