# Google Ads Analytics Pipeline

<p align="center">
  <img src="https://img.shields.io/badge/Fivetran-34495E?style=for-the-badge&logo=fivetran&logoColor=white" />
  <img src="https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white" />
  <img src="https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white" />
  <img src="https://img.shields.io/badge/PowerBI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black" />
</p>

### End-to-End Modern Data Stack

## 🎯 Project Overview
This project demonstrates a production-ready data engineering workflow that transforms raw Google Ads data into actionable marketing insights. Using a **Medallion (Star Schema) Architecture**, I converted unstructured API data from Fivetran into a high-performance analytical hub.

## 📺 Project Demo
Click the image below to watch the full demo on YouTube:

[![Watch the Demo](https://img.youtube.com/vi/otph3H1tDtQ/maxresdefault.jpg)](https://youtu.be/otph3H1tDtQ)


*A walkthrough covering the Snowflake ingestion, dbt transformations, and Power BI visualization.*

---

## 🏗️ Architecture & Stack
* **Data Ingestion:** [Fivetran](https://fivetran.com/) (Automated extraction from Google Ads API to Snowflake).
* **Data Warehouse:** [Snowflake](https://www.snowflake.com/) (Bronze/Silver/Gold layering).
* **Transformation:** [dbt Core](https://www.getdbt.com/) (SQL modeling, testing, and documentation).
* **BI & Visualization:** [Power BI](https://powerbi.microsoft.com/) (Star Schema modeling and KPI reporting).

### Data Lineage
![dbt Lineage Graph]([./google_ads_project_lineage.png])

The pipeline follows a modular design:
1.  **Staging Layer:** Cleaning, casting, and renaming raw fields.
2.  **Marts Layer (Star Schema):** * `dim_ad_groups`: Enforced uniqueness to act as the single source of truth for metadata.
    * `fct_advertising_performance`: Aggregated daily performance metrics.
    * `fct_click_details`: Granular click-level attribution data.

---

## 🚀 Key Features & Logic
* **Star Schema Optimization:** Implemented a **1:Many relationship** between Dimensions and Facts to ensure high query performance and data integrity.
* **Automated KPIs:** Centralized business logic in dbt for metrics like **Average CPC** and **CTR**, including `NULLIF` handling to prevent division-by-zero errors.
* **Uniqueness Enforcement:** Utilized `group by` and `any_value` logic in dbt to resolve "Many-to-Many" relationship conflicts.

---

## 📊 Business Impact
* **Eliminated Manual Reporting:** Automated the extraction and cleaning of Google Ads data.
* **Improved Accuracy:** Centralized logic in the warehouse ensures consistent KPIs across all reports.
* **Scalability:** Modular dbt structure allows for easy integration of new data sources (e.g., Facebook or LinkedIn).

---

## 🛠️ How to Run
1. **Clone the repo:**
2. **Setup dbt:**

  - Configure your profiles.yml with Snowflake credentials.

  - Run dbt deps to install dependencies.

3. **Build the Pipeline:**

 - dbt build
