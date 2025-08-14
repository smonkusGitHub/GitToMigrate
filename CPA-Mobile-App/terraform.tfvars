# -------------------------------------------------
# Location and tags defination
# -------------------------------------------------
location          = "australiaeast"
tags = {
  Product         = "Mobile App"
  Environment     = "Test"
  "Support Owner" = "ADIS Squad"
  CreatedWith     = "Terraform"
}

# -------------------------------------------------
# Course - Storage Containers
# -------------------------------------------------
containers_course = [
  { name = "azure-webjobs-hosts",   container_access_type = "private" },
  { name = "cpa-course-files",      container_access_type = "private" }
]

# -------------------------------------------------
# Course - Service Bus Authorization
# -------------------------------------------------
authorization_rules_shared_course = {
  send_rule = {
    name   = "send-rule"
    send   = true
  }
  listen_rule = {
    name   = "listen-rule"
    listen = true
  }
  manage_rule = {
    name   = "manage-rule"
    manage = true
    send   = true
    listen = true
  }
}

# -------------------------------------------------
# Podcast - Storage Containers
# -------------------------------------------------
storage_containers_podcast = [
  { name = "azure-webjobs-hosts",   container_access_type = "private" },
  { name = "cpa-podcast-files",     container_access_type = "private" },
  { name = "master",                container_access_type = "private" }
]

# -------------------------------------------------
# Podcast - Storage queues
# -------------------------------------------------
storage_queues_podcast = [
  { name = "stqcpamatstae01podcast" }
]

# -------------------------------------------------
# Podcast - Storage queues
# -------------------------------------------------
storage_tables_podcast = [
  { name = "sttcpamatstae01podcast" }
]

# -------------------------------------------------
# Podcast - private endpoints
# -------------------------------------------------
private_endpoints_service_connections_podcast = [
  { name = "pe-st",   subresource_name   = "blob",  network_interface_name = "nic-pe-st"},
  { name = "pe-que",  subresource_name   = "queue", network_interface_name = "nic-pe-que"},
  { name = "pe-tb",   subresource_name   = "table", network_interface_name = "nic-pe-tb" }
]

private_endpoints = [
  {
    name             = "pe-blob"
    subresource_name = "blob"
  },
  {
    name             = "pe-queue"
    subresource_name = "queue"
  },
  {
    name             = "pe-table"
    subresource_name = "table"
  }
]