output "bronze_job_id" {
  description = "Databricks Job ID for MAS610 Bronze Load"
  value       = databricks_job.bronze_ingest_job.id
}

output "bronze_job_name" {
  description = "Name of the deployed Databricks job"
  value       = databricks_job.bronze_ingest_job.name
}
