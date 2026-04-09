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
# Content Aggregation - Storage Containers
# -------------------------------------------------
storage_containers_contentaggregation = [
  { name = "azure-webjobs-hosts",         container_access_type = "private" },
  { name = "notification-job-user-lists", container_access_type = "private" }
]

# -------------------------------------------------
# EMS - Storage Containers
# -------------------------------------------------
storage_containers_ems = [
  { name = "azure-webjobs-hosts",   container_access_type = "private" }
]