# -----------------------------
# TFLint Configuration for Azure
# -----------------------------

plugin "azurerm" {
  enabled = true
  version = ">= 0.29.0" # Use the latest version from GitHub releases
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
rule "terraform_unused_declarations" { enabled = false }