
# 💼 MAS610-ENTRA: Azure Regulatory Data Platform

### 📘 Overview
**MAS610-ENTRA** is an end-to-end regulatory data platform built on **Azure Data Lake Gen2**, **Databricks**, and **Terraform** to automate **Monetary Authority of Singapore (MAS)** reporting — specifically returns **MAS 610, MAS 309, MAS 652, MAS 640**, and **MAS 1003/1303**, aligned to **Basel III/IV** frameworks.

The solution integrates ingestion, transformation, data quality, reconciliation, and CI/CD automation to deliver MAS-compliant financial, risk, and compliance reporting with full lineage, auditability, and scalability.

---

## 🧠 Key Objectives
- Automate **Regulatory Reporting** for MAS 610 and related Basel III/IV returns.  
- Establish a **Medallion Architecture (Bronze / Silver / Gold)** on Azure Data Lake.  
- Implement **Data Quality (DQ) & Reconciliation** frameworks for accuracy and completeness.  
- Enable **Model Governance** for PD/LGD/EAD and liquidity models via Databricks MLflow.  
- Provide **Continuous Integration / Deployment (CI/CD)** and **Infrastructure-as-Code (IaC)** using Terraform and GitHub Actions.  

---

## ⚙️ Architecture Overview
```text
Source Systems → ADF Ingestion (Bronze) → Databricks Transformations (Silver) →  
Regulatory Modeling & Aggregation (Gold) → Power BI / MAS Returns → DCG Submission
````

**Core Azure Components:**

* **Azure Data Lake Gen2** – centralized data storage
* **Azure Databricks** – PySpark transformation and ML governance
* **Azure Data Factory (ADF)** – orchestration and scheduling
* **Azure Synapse** – analytical layer and SQL-based aggregation
* **Azure Purview** – lineage and governance
* **Azure Key Vault** – secrets management
* **Terraform** – infrastructure automation
* **Power BI** – DQ dashboards and MAS report visualizations

---

## 🧩 Repository Structure

```
mas610-entra/
│
├── databricks/
│   ├── notebooks/
│   │   ├── MAS610_Bronze_Load.py
│   │   ├── MAS610_Silver_Transform.py
│   │   ├── MAS610_Gold_Model.py
│   │   ├── DQ_Validation.py
│   │   └── Reconciliation_Checks.py
│   └── jobs/
│       ├── eventhub_producer.py
│       ├── consumer_streaming_riskfeed.py
│       └── pipeline_trigger_config.json
│
├── adf_pipelines/
│   ├── pipeline_ingestion.json
│   ├── pipeline_dq_validation.json
│   ├── pipeline_reconciliation.json
│   └── trigger_on_new_trade_file.json
│
├── sql_warehouse/
│   ├── mas610_gold_views.sql
│   ├── mas652_large_exposure.sql
│   ├── dq_results_validation.sql
│   └── reconciliation_metrics.sql
│
├── .gitignore
├── README.md
└── LICENSE
```

---

## 🚀 Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/saru-2025/mas610-entra.git
cd mas610-entra
```

### 2. Configure Azure authentication

```bash
az login --tenant "<tenant-id>"
az account set --subscription "<subscription-id>"
```

### 3. Deploy infrastructure using Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
```

### 4. Configure Databricks CLI (with AAD token)

```bash
az login
token_response=$(az account get-access-token --resource 2ff814a6-3304-4ab8-85cb-cd0e6f879c1d)
export DATABRICKS_AAD_TOKEN=$(jq .accessToken -r <<< "$token_response")

databricks configure --aad-token
```

### 5. Run notebooks for ingestion and transformation

```bash
databricks workspace import_dir ./databricks/notebooks /Workspace/Shared/MAS610
databricks jobs create --json-file ./databricks/jobs/pipeline_trigger_config.json
```

---

## 🧮 Exercises (from Hands-On Coding Assessment)

| Exercise                               | Description                                                                              | Skill Area           |
| -------------------------------------- | ---------------------------------------------------------------------------------------- | -------------------- |
| **1. Real-Time Risk Feed**             | Kafka/EventHub → Databricks Structured Streaming (5-min aggregation, DLQ, DQ validation) | Streaming + ETL      |
| **2. Regulatory Data Model (MAS 610)** | Transform `accounts`, `loans`, `collateral` CSVs → MAS 610 Balance Sheet                 | SQL/PySpark Modeling |
| **3. CI/CD & IaC**                     | Automate Databricks deployment + Terraform cluster provisioning                          | DevOps & Automation  |

---

## 🧠 Data Quality & Reconciliation

* **DQ Rule Categories:** Completeness, Accuracy, Consistency, Timeliness
* **Rule Repository:** `dq_rule_master` (Delta Table)
* **Execution Framework:** ADF + Databricks Notebooks
* **Monitoring:** Power BI dashboards showing DQ scores, failed rules, and reconciliation variance (<0.1%)

---

## 🧰 Governance & Security

| Layer           | Control                      | Azure Service              |
| --------------- | ---------------------------- | -------------------------- |
| Identity        | Role-based access (RBAC/MFA) | Azure AD                   |
| Data Encryption | AES-256 / TLS 1.2+           | ADLS Gen2 + Key Vault      |
| Audit & Lineage | End-to-end traceability      | Azure Purview              |
| CI/CD Security  | Secrets scanning & approvals | GitHub Actions + Key Vault |
| Compliance      | MAS TRM, PDPA, ISO 27001     | Azure Policy + Sentinel    |

---

## 📊 Reporting and Visualization

* Power BI dashboards: DQ Scores, MAS Returns, Reconciliation Variance
* SQL Warehouse queries for MAS 610, 309, 652, 640
* Data exported as CSV/XML templates for MAS Data Collection Gateway (DCG)

---

## 🧱 Future Roadmap

* ✅ Real-time MAS 309 liquidity monitoring via Event Grid
* 🤖 AI-driven DQ anomaly detection using Databricks AutoML
* 🌏 Cross-regulatory schema harmonization (MAS, HKMA, BNM)
* 🧾 Explainable AI (XAI) for PD/LGD and liquidity models
* 🌱 ESG data integration and sustainability metrics

---

## 🧑‍💻 Contributors

**Author:** Saritha Mantripragada
**Role:** Senior Data Engineer / Lead Data Architect
**Focus:** Azure + Databricks Regulatory Data Platforms for BFSI

---

## 📜 License

This repository is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

