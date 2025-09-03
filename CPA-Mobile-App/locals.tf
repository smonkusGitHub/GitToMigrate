locals {
  # -------------------------------------------------
  # Bookmark
  # -------------------------------------------------
  resource_group_name_bookmark                        = "rg-${var.location_short_name}-${var.environment_short_name}-${var.project_long_name}-bookmark-01"
  # SQL
  #sql_database_name_bookmark                          = "sqldb-cpa-web-${var.environment_short_name}-${var.location_short_name}-01-bookmark"

  # -------------------------------------------------
  # Content Aggregation
  # -------------------------------------------------
  resource_group_name_contentaggregation              = "rg-${var.location_short_name}-${var.environment_short_name}-${var.project_long_name}-contentaggregation-01"
  # SQL
  sql_database_name_contentaggregation                = "sqldb-cpa-web-${var.environment_short_name}-${var.location_short_name}-01-contentaggregation"
  # Notification Hub
  notification_hub_ns_name_contentaggregation         = "notification-hub-ns-${var.environment_short_name}-${var.location_short_name}-01-contentaggregation"
  notification_hub_name_contentaggregation            = "notification-hub-${var.environment_short_name}-${var.location_short_name}-01-contentaggregation"
  #notification_hub_rule1_contentaggregation           = "notification-hub-rule1-${var.environment_short_name}-${var.location_short_name}-01-contentaggregation"
    
  # -------------------------------------------------
  # Course
  # -------------------------------------------------
  resource_group_name_course                          = "rg-${var.location_short_name}-${var.environment_short_name}-${var.project_long_name}-course-01"
  # Storage
  # storage_name_course                                 = "st${var.company_short_name}${var.project_short_name}${var.environment_short_name}${var.location_short_name}01course"
  # # SQL
  # sql_database_name_course                            = "sqldb-cpa-web-${var.environment_short_name}-${var.location_short_name}-01-course"
  # eventgrid_system_topic_name_course                  = "egs-${var.environment_short_name}-${var.location_short_name}-csv-file-downloaded-topic-01-course"
  # eventgrid_system_event_sub_name_course              = "egs-${var.environment_short_name}-${var.location_short_name}-csv-file-downloaded-01-course"
  # eventgrid_topic_name_course                         = "egt-${var.environment_short_name}-${var.location_short_name}-csv-file-downloaded-topic-01-course"    
  # # Private Endpoints - Storage (blob)
  # private_endpoint_st_name_course_blob                = "pe-st-blob-${var.environment_short_name}-${var.location_short_name}-01-course"
  # private_network_interface_st_name_course_blob       = "nic-pe-st-blob-${var.environment_short_name}-${var.location_short_name}-01-course"
  # private_dns_zone_group_st_name_course_blob          = "privatelink.blob.core.windows.net"
  # private_dns_zone_resource_st_id_course_blob         = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
  # private_service_connection_st_name_course_blob      = "psc-st-blob-${var.environment_short_name}-${var.location_short_name}-01-course"
  # # Private Endpoints - Storage (queue)
  # private_endpoint_st_name_course_queue                = "pe-st-queue-${var.environment_short_name}-${var.location_short_name}-01-course"
  # private_network_interface_st_name_course_queue       = "nic-pe-st-queue-${var.environment_short_name}-${var.location_short_name}-01-course"
  # private_dns_zone_group_st_name_course_queue          = "privatelink.queue.core.windows.net"
  # private_dns_zone_resource_st_id_course_queue         = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.queue.core.windows.net"
  # private_service_connection_st_name_course_queue      = "psc-st-queue-${var.environment_short_name}-${var.location_short_name}-01-course"
  # # Private Endpoints - Storage (table)
  # private_endpoint_st_name_course_table                = "pe-st-table-${var.environment_short_name}-${var.location_short_name}-01-course"
  # private_network_interface_st_name_course_table       = "nic-pe-st-table-${var.environment_short_name}-${var.location_short_name}-01-course"
  # private_dns_zone_group_st_name_course_table          = "privatelink.table.core.windows.net"
  # private_dns_zone_resource_st_id_course_table         = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.table.core.windows.net"
  # private_service_connection_st_name_course_table      = "psc-st-table-${var.environment_short_name}-${var.location_short_name}-01-course"
    
  # -------------------------------------------------
  # Podcast
  # -------------------------------------------------
  resource_group_name_podcast                         = "rg-${var.location_short_name}-${var.environment_short_name}-${var.project_long_name}-podcast-01"
  # # Storage
  # storage_name_podcast                                = "st${var.company_short_name}${var.project_short_name}${var.environment_short_name}${var.location_short_name}01podcast"
  # storage_queue_name_podcast                          = "stq${var.company_short_name}${var.project_short_name}${var.environment_short_name}${var.location_short_name}01podcast"
  # storage_table_name_podcast                          = "stt${var.company_short_name}${var.project_short_name}${var.environment_short_name}${var.location_short_name}01podcast"
  # # Private Endpoints - Storage
  # private_endpoint_st_name_podcast                    = "pe-st-${var.environment_short_name}-${var.location_short_name}-01-podcast"
  # private_network_interface_st_name_podcast           = "nic-pe-st-${var.environment_short_name}-${var.location_short_name}-01-podcast"
  # private_dns_zone_group_st_name_podcast              = "privatelink.blob.core.windows.net"
  # private_dns_zone_resource_st_id_podcast             = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
  # private_service_connection_st_name_podcast          = "psc-st-${var.environment_short_name}-${var.location_short_name}-01-podcast"  
  # # Private Endpoints - Queue
  # private_endpoint_que_name_podcast                   = "pe-que-${var.environment_short_name}-${var.location_short_name}-01-podcast"
  # private_network_interface_que_name_podcast          = "nic-pe-que-${var.environment_short_name}-${var.location_short_name}-01-podcast"
  # private_dns_zone_group_que_name_podcast             = "privatelink.queue.core.windows.net"
  # private_dns_zone_resource_que_id_podcast            = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.queue.core.windows.net"
  # private_service_connection_que_name_podcast         = "psc-que-${var.environment_short_name}-${var.location_short_name}-01-podcast"
  # # Private Endpoints - Table
  # private_endpoint_tb_name_podcast                    = "pe-tb-${var.environment_short_name}-${var.location_short_name}-01-podcast"
  # private_network_interface_tb_name_podcast           = "nic-pe-tb-${var.environment_short_name}-${var.location_short_name}-01-podcast"
  # private_dns_zone_group_tb_name_podcast              = "privatelink.table.core.windows.net"
  # private_dns_zone_resource_tb_id_podcast             = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.table.core.windows.net"
  # private_service_connection_tb_name_podcast          = "psc-tb-${var.environment_short_name}-${var.location_short_name}-01-podcast"

  # -------------------------------------------------
  # Taxonomy
  # -------------------------------------------------
  resource_group_name_taxonomy                        = "rg-${var.location_short_name}-${var.environment_short_name}-${var.project_long_name}-taxonomy-01"
  # SQL
  #sql_database_name_taxonomy                          = "sqldb-cpa-web-${var.environment_short_name}-${var.location_short_name}-01-taxonomy"

  # -------------------------------------------------
  # Website
  # -------------------------------------------------
  resource_group_name_website                         = "rg-${var.location_short_name}-${var.environment_short_name}-${var.project_long_name}-website-01"

  # -------------------------------------------------
  # Shared
  # -------------------------------------------------
  resource_group_name_shared                          = "rg-${var.location_short_name}-${var.environment_short_name}-${var.project_long_name}-shared-01"
  # Tagging with current date
  # tags = merge(var.tags, {
  #   CreatedDate = formatdate("DD-MM-YYYY", plantimestamp())
  # })

  # # Storage Logic it will loop through all the type and build private end point for each item.
  # storageendpoints                                    = toset(["blob", "queue", "table"])
  
  # # Event Grid Topic
  # eventgrid_topic_name_course_shared                  = "egt-${var.environment_short_name}-${var.location_short_name}-01-course"
  # eventgrid_topic_name_podcast_shared                 = "egt-${var.environment_short_name}-${var.location_short_name}-01-podcast"
  # # Private Endpoints - Event Grid Topic Course
  # private_endpoint_egt_course_name_shared             = "pe-egt-${var.environment_short_name}-${var.location_short_name}-course-01-shared"
  # private_network_interface_egt_course_name_shared    = "nic-egt-${var.environment_short_name}-${var.location_short_name}-course-01-shared"
  # private_service_connection_egt_course_name_shared   = "psc-egt-${var.environment_short_name}-${var.location_short_name}-course-01-shared"
  # # Private Endpoints - Event Grid Topic Podcast
  # private_endpoint_egt_podcast_name_shared            = "pe-egt-${var.environment_short_name}-${var.location_short_name}-podcast-01-shared"
  # private_network_interface_egt_podcast_name_shared   = "nic-egt-${var.environment_short_name}-${var.location_short_name}-podcast-01-shared"
  # private_service_connection_egt_podcast_name_shared  = "psc-egt-${var.environment_short_name}-${var.location_short_name}-podcast-01-shared"

  # # Event Hub NS and consumer group
  # eventhub_namespace_name_shared                      = "evhns-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # eventhub_namespace_auth_rule_shared                 = "evhauth-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # eventhub_name_shared                                = "evh-${var.environment_short_name}-${var.location_short_name}-podcast-01-shared"
  # eventhub_consumer_group_name_shared                 = "evhcg-${var.environment_short_name}-${var.location_short_name}-podcast-01-shared"

  # # Redis Cache and firewall rules
  # redis_cache_name_shared                             = "redis-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # # Private Endpoints - Redis Cache 1
  # private_endpoint_redis_name1_shared                 = "pe-redis-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_network_interface_redis_name1_shared        = "nic-redis-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_dns_zone_group_redis_name1_shared           = "privatelink.redis.cache.windows.net"
  # private_dns_zone_resource_redis_id1_shared          = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.redis.cache.windows.net"
  # private_service_connection_redis_name1_shared       = "psc-redis-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # # Private Endpoints - Redis Cache 2
  # private_endpoint_redis_name2_shared                 = "pe-redis-${var.environment_short_name}-${var.location_short_name}-02-shared"
  # private_network_interface_redis_name2_shared        = "nic-redis-${var.environment_short_name}-${var.location_short_name}-02-shared"
  # private_dns_zone_group_redis_name2_shared           = "privatelink.redis.cache.windows.net"
  # private_dns_zone_resource_redis_id2_shared          = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.redis.cache.windows.net"
  # private_service_connection_redis_name2_shared       = "psc-redis-${var.environment_short_name}-${var.location_short_name}-02-shared"

  # # SignalR
  # signalr_name_shared                                 = "sig-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # # Private Endpoints - SignalR
  # private_endpoint_signalr_name_shared                = "pe-signalr-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_network_interface_signalr_name_shared       = "nic-signalr-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_service_connection_signalr_name_shared      = "psc-signalr-${var.environment_short_name}-${var.location_short_name}-01-shared"

  # # Application Insight and Log Analytics  
  # log_analytics_workspace_name_shared                 = "log-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # wsmonitor_link_name_shared                          = "log-mpl-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # application_insight_name_shared                     = "ai-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # monitor_link_name_shared                            = "ai-mpl-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # monitor_link_scope_name_shared                      = "ampls-cpa-prd-ae-001-infra"
  # monitor_link_resource_group_shared                  = "rg-cpa-prd-ae-001-shared-infra"
  # actiongroup_name_shared                             = "application insights smart detection"
  # alert_rule01_name_shared                            = "Failure Anomalies - ai-${var.environment_short_name}-${var.location_short_name}-01-shared"
  
  # # KeyVault  
  # keyvault_name_shared                                = "kv-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # # Private Endpoints - KeyVault  
  # private_endpoint_keyvault_name_shared               = "pe-kv-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_network_interface_keyvault_name_shared      = "nic-kv-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_dns_zone_group_keyvault_name_shared         = "privatelink.vaultcore.azure.net"
  # private_dns_zone_resource_keyvault_id_shared        = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"
  # private_service_connection_keyvault_name_shared     = "psc-kv-${var.environment_short_name}-${var.location_short_name}-01-shared"

  # # Service Bus, Topic, Queue, Subscription & Rule
  servicebus_namespace_name_shared                    = "sbus-${var.company_short_name}${var.project_short_name}${var.environment_short_name}${var.location_short_name}-01-shared"
  # servicebus_topic_name_shared_course                 = "sync-courses"
  # servicebus_subscription_name_shared_course          = "test-create-course-subscription"
  # servicebus_subscription_rule_name_shared_course     = "test-create-course-subscription-rule"  
  # servicebus_queue_name_shared_queue                  = "sbq-${var.environment_short_name}-${var.location_short_name}-deltachanges-podcast-01-shared"
  # # Private Endpoints - Service Bus  
  private_endpoint_sb_name_shared_course              = "pe-sb-${var.environment_short_name}-${var.location_short_name}-01-shared-course"
  private_network_interface_sb_name_shared_course     = "nic-pe-sb-${var.environment_short_name}-${var.location_short_name}-01-shared-course"
  private_dns_zone_group_sb_name_shared_course        = "privatelink.servicebus.windows.net"
  private_dns_zone_resource_sb_id_shared_course       = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"
  private_service_connection_sb_name_shared_course    = "psc-sb-${var.environment_short_name}-${var.location_short_name}-01-shared-course"

  # # SQL Server for all databases
  sql_server_name_shared                              = "sql-${var.location_short_name}-${var.environment_short_name}-${var.project_long_name}-shared-01"

  # # Private Endpoints - SQL
  # private_endpoint_sql_name_shared                    = "pe-sql-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_network_interface_sql_name_shared           = "nic-pe-sql-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_dns_zone_group_sql_name_shared              = "privatelink.database.windows.net"
  # private_dns_zone_resource_sql_id_shared             = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.database.windows.net"
  # private_service_connection_sql_name_shared          = "psc-sql-${var.environment_short_name}-${var.location_short_name}-01-shared"

  # # Cosmos DB Account
  # cosmosdb_name_shared                                = "cos-db-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # cosmosdb_kind_shared                                = "GlobalDocumentDB"
  # cosmosdb_offer_type_shared                          = "Standard"
  # cosmosdb_consistency_level_shared                   = "Session"
  # cosmosdb_consistency_level_min_shared               = 5
  # cosmosdb_consistency_level_max_shared               = 100
  # cosmosdb_backup_type_shared                         = "Periodic"
  # cosmosdb_backup_interval_in_minutes_shared          = 240
  # cosmosdb_backup_retention_in_hours_shared           = 8
  # cosmosdb_backup_storage_redundancy_shared           = "Geo"

  # # Cosmos cosmosdb_defender
  # cosmosdb_diagnostics_name_shared                    = "cos-db-diagnostics-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # cosmosdb_defender_tier_shared                       = "Standard"
  # cosmosdb_defender_resource_type_shared              = "CosmosDbs"

  # # Cosmos SQL Database
  # cosmosdb_sql_database_mobile_name_shared            = "cos-sql-db-mobileapp-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # # Private Endpoints - Cosmos SQL
  # private_endpoint_cosmodb_sql_name_shared            = "pe-cos-sql-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_network_interface_cosmodb_sql_name_shared   = "nic-pe-cos-sql-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # private_dns_zone_group_cosmodb_sql_name_shared      = "privatelink.documents.azure.com"
  # private_dns_zone_resource_cosmodb_sql_id_shared     = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.documents.azure.com"
  # private_service_connection_cosmodb_sql_name_shared  = "psc-sql-${var.environment_short_name}-${var.location_short_name}-01-shared"
  
  # # Cosmos SQL Container
  # cosmosdb_sql_container_notifications_name_shared    = "cos-sql-db-notifications-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # cosmosdb_sql_container_partition_key_paths_shared   = "/CpaAustraliaId"
  # cosmosdb_sql_container_indexing_mode_shared         = "consistent"
  # cosmosdb_sql_container_included_path_shared         = "/*"
  # cosmosdb_sql_container_excluded_path_shared         = "/\"_etag\"/?"
  # cosmosdb_sql_container_conflict_res_mode_shared     = "LastWriterWins"
  # cosmosdb_sql_container_conflict_res_path_shared     = "/_ts"
  # cosmosdb_sql_container_autoscale_max_shared         = 10000
  # # Cosmos SQL Role Definitions
  # cosmosdb_sql_role_data_reader_shared                = "cos-sql-role-data-reader-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # cosmosdb_sql_role_type_shared                       = "BuiltInRole"
  # cosmosdb_sql_role_data_contributor_shared           = "cos-sql-role-data-contributor-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # # Cosmos Table Role Definitions
  # cosmosdb_table_role_data_reader_shared              = "cos-table-role-data-reader-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # cosmosdb_table_role_data_contributor_shared         = "cos-table-role-data-contributor-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # cosmosdb_table_role_data_reader_name_shared         = "72e91379-ea85-5894-41ef-41290308593d"
  # cosmosdb_table_role_data_contributor_name_shared    = "c870bb7d-25e7-d3a5-cd20-4fa7e78da3cf"

  # # -------------------------------------------------
  # # SQL Server and Database
  # # -------------------------------------------------
  sql_server_azuread_administrator_name               = "sqlaccess-sql-ae-tst-mobileapp-admins"
  sql_server_azuread_administrator_id                 = "d5623571-f297-4a07-853d-e707a8bb89a3"

  sql_database_sku_name                               = "GP_S_Gen5_2"
  sql_database_collation                              = "SQL_Latin1_General_CP1_CI_AS"
  sql_database_create_mode                            = "Default"
  sql_database_max_size_gb                            = 32
  sql_database_min_capacity                           = 0.5
  sql_database_read_replica_count                     = 0
  sql_database_retention_days                         = 7
  sql_database_backup_interval_in_hours               = 12
  
  # # -------------------------------------------------
  # # Storage Account
  # # -------------------------------------------------
  # storageaccount_account_replication_type             = "LRS"
  # storageaccount_account_tier                         = "Standard"
  # storageaccount_account_kind                         = "StorageV2"
  # storageaccount_min_tls_version                      = "TLS1_2"

  # -------------------------------------------------
  # Service Bus
  # -------------------------------------------------
  # we are setting this to basic because "Premium High Cost" waiting for dev team to deploy, 
  # comment(Basic)/uncomment(Premium) out the the following:
  # Shared
  # - private end point
  # - shared_course_topic
  # - shared_course_subscription
  # - shared_course_rule
  # Course
  # - eventgrid-system-topic-sub-course

  servicebus_sku                                      = "Basic"
  servicebus_capacity                                 = 1
  servicebus_premium_messaging_partitions             = 1

  # -------------------------------------------------
  # App Configuration
  # -------------------------------------------------
  appconfig_name_shared                               = "appcs-${var.environment_short_name}-${var.location_short_name}-01-shared"
  # appconfig_sku_name_shared                           = "standard"
  # appconfig_local_auth_enabled_shared                 = false
  # appconfig_public_network_access_shared              = "Disabled"
  # appconfig_purge_protection_enabled_shared           = true
  # appconfig_soft_delete_retention_days_shared         = 7
    
  # Private Endpoints - App Configuration  
  private_endpoint_appconfig_name_shared              = "pe-appcs-${var.environment_short_name}-${var.location_short_name}-01-shared"
  private_network_interface_appconfig_name_shared     = "nic-appcs-${var.environment_short_name}-${var.location_short_name}-01-shared"
  private_dns_zone_group_appconfig_name_shared        = "privatelink.azconfig.io"
  private_dns_zone_resource_appconfig_id_shared       = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.azconfig.io"
  private_service_connection_appconfig_name_shared    = "psc-appcs-${var.environment_short_name}-${var.location_short_name}-01-shared"

}