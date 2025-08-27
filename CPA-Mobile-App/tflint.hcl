# -----------------------------
# TFLint Configuration for Azure
# -----------------------------

plugin "azurerm" {
  enabled = true
  version = "0.29.0"  # Use the latest version from GitHub releases
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

# -----------------------------
# SQL Resources
# -----------------------------
rule "azurerm_sql_server_version" { enabled = true }
rule "azurerm_sql_database_sku" { enabled = true }

# -----------------------------
# Virtual Machine & Compute
# -----------------------------
rule "azurerm_virtual_machine_instance_type" { enabled = true }

# -----------------------------
# Storage
# -----------------------------
rule "azurerm_storage_account_sku" { enabled = true }
rule "azurerm_storage_account_kind" { enabled = true }

# -----------------------------
# Networking
# -----------------------------
rule "azurerm_private_endpoint_subnet" { enabled = true }
rule "azurerm_network_interface_ip_configuration" { enabled = true }

# -----------------------------
# Messaging & Event
# -----------------------------
rule "azurerm_servicebus_sku" { enabled = true }
rule "azurerm_eventgrid_topic_sku" { enabled = true }
rule "azurerm_notification_hub_sku" { enabled = true }

# -----------------------------
# Cache & SignalR
# -----------------------------
rule "azurerm_redis_cache_sku" { enabled = true }
rule "azurerm_signalr_service_sku" { enabled = true }

# -----------------------------
# Security & Secrets
# -----------------------------
rule "azurerm_key_vault_sku" { enabled = true }

# -----------------------------
# Databases
# -----------------------------
rule "azurerm_cosmosdb_account_offer_type" { enabled = true }

# -----------------------------
# Monitoring
# -----------------------------
rule "azurerm_application_insights_application_type" { enabled = true }

# -----------------------------
# General Best Practices
# -----------------------------
rule "terraform_required_version" { enabled = true }
rule "terraform_unused_declarations" { enabled = true }

# -----------------------------
# Ignore specific unused locals
# -----------------------------
ignore "terraform_unused_declarations" {
  name = "local.sql_database_name_bookmark"
}
ignore "terraform_unused_declarations" {
  name = "local.sql_database_name_contentaggregation"
}
ignore "terraform_unused_declarations" {
  name = "local.notification_hub_rule1_contentaggregation"
}
ignore "terraform_unused_declarations" {
  name = "local.private_service_connection_st_name_course_table"
}
ignore "terraform_unused_declarations" {
  name = "local.storage_name_podcast"
}
ignore "terraform_unused_declarations" {
  name = "local.storage_queue_name_podcast"
}
ignore "terraform_unused_declarations" {
  name = "local.storage_table_name_podcast"
}
ignore "terraform_unused_declarations" {
  name = "local.private_endpoint_st_name_podcast"
}
ignore "terraform_unused_declarations" {
  name = "local.private_network_interface_st_name_podcast"
}