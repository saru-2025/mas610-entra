# ================================================
# Phase 2 - MAS610 Terraform Job Deployment
# ================================================
resource "databricks_job" "bronze_ingest_job" {
  name                = "MAS610_Bronze_Load"
  existing_cluster_id = var.existing_cluster_id

  notebook_task {
    notebook_path = "/Shared/MAS610_Bronze_Load"
  }

  email_notifications {
    on_failure = [var.email_notification]
  }

  max_concurrent_runs = 1
} 
