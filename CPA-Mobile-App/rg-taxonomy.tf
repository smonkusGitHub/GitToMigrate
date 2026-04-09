# -------------------------------------------------
# Module to create AVM Resource Group
# -------------------------------------------------
module "avm-res-resources-resourcegroup-taxonomy" {
    source                          = "Azure/avm-res-resources-resourcegroup/azurerm"
    version                         = "0.2.1"
    name                            = local.resource_group_name_taxonomy
    location                        = var.location
    tags                            = var.tags
}

# ------------------------------------------------------------
# Module to create AVM Azure SQL Database
# ------------------------------------------------------------
module "avm-res-sql-server-database-taxonomy" {
    source                          = "Azure/avm-res-sql-server/azurerm//modules/database"
    version                         = "0.1.3"
    name                            = local.sql_database_name_taxonomy 
    sql_server                      = { resource_id = module.avm-res-sql-server-shared.resource_id }
    tags                            = var.tags
    sku_name                        = local.sql_database_sku_name
    auto_pause_delay_in_minutes     = local.sql_database_auto_pause_delay_in_minutes
    collation                       = local.sql_database_collation
    create_mode                     = local.sql_database_create_mode
    ledger_enabled                  = false    
    max_size_gb                     = local.sql_database_max_size_gb
    min_capacity                    = local.sql_database_min_capacity
    read_replica_count              = local.sql_database_read_replica_count
    read_scale                      = false
    zone_redundant                  = false
    storage_account_type            = local.storage_account_type    
    short_term_retention_policy     = {
        retention_days              = local.sql_database_retention_days
        backup_interval_in_hours    = local.sql_database_backup_interval_in_hours
      }
}