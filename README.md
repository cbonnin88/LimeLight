# 🌲 EcoPulse Systems: HR & People Analytics Pipeline
### End-to-End Modern Data Stack Project (GreenTech Industry)

![EcoPulse Logo](https://raw.githubusercontent.com/username/repo/main/logo.png) **

## 📌 Overview
EcoPulse Systems is a fictitious GreenTech company headquartered in France with 10,000 employees across 7 European countries. This project demonstrates a full-scale data engineering and analytics pipeline designed to solve two critical HR challenges: **Gender Pay Equity** and **Employee Retention (Churn Prediction).**

## 🛠️ The Tech Stack
* **Data Generation:** Python (Polars & Faker)
* **Data Warehouse:** Google BigQuery (Sandbox)
* **Transformation:** dbt (Data Build Tool)
* **Ad-hoc Analysis:** Google Sheets (XLOOKUP, Pivot Tables)
* **Data Science:** Scikit-Learn (Random Forest Classifier)
* **Visualization:** Plotly (Python) & Looker Studio
* **Data Product:** Streamlit

---

## 🏗️ Architecture & Data Workflow
The project follows a **Medallion Architecture** (Bronze → Silver → Gold):

1.  **Phase 1: Generation & Cleaning:** Used **Polars** to generate 10k localized records. Applied strict mapping between Job Titles and Departments to ensure data integrity.
2.  **Phase 2: Staging (dbt):** Ingested raw CSVs into BigQuery. Used dbt to create staging models (`stg_employees`) with schema testing for unique IDs and accepted values.
3.  **Phase 3: Marts (dbt):** Joined Employees, Compensation, and Office dimensions into a "Gold" `dim_employee_directory` table.
4.  **Phase 4: Advanced SQL:** Applied **Window Functions** (`ROW_NUMBER`, `PERCENT_RANK`) in BigQuery to identify top earners and calculate salary compression metrics.



---

## 🔬 Key Analyses

### 1. Gender Pay Gap (Parity Analysis)
Using **Plotly Sunburst** and **Box Plots**, I visualized the distribution of salaries across departments and genders. 
* **Insight:** Identified specific departments in the UK office where the pay gap exceeded 5%, triggering a simulated "Equity Audit."

### 2. Retention Risk (Machine Learning)
Built a **Random Forest Classifier** to predict the probability of employee resignation.
* **Features:** Tenure, Performance, Salary Band, Remote Type, and Management Status.
* **Accuracy:** The model successfully identified "High Risk" individuals who were top performers but placed in lower salary bands (L4/L5).



---

## 📊 Visualizations & Dashboards

### [Looker Studio Executive Dashboard](https://datastudio.google.com/reporting/bca689c0-dfe0-4913-81a2-515330bb12c9)
A high-level view for the CEO and HR Director featuring:
* **Interactive Maps:** Employee distribution by country.
* **Risk Scorecards:** Real-time calculation of "Retention Risk %."
* **Heatmaps:** Performance vs. Salary Band intersection.

### Streamlit Salary Calculator
A standalone tool for HR Managers to input a Department and Role to see:
* Real-time salary benchmarks (25th, 50th, 75th percentiles).
* Current headcount density for that specific role.

---

## 🚀 How to Run
1.  **Clone the Repo:** `git clone https://github.com/your-username/ecopulse-hr-analytics.git`
2.  **dbt Setup:**
    * Navigate to the `/dbt` folder.
    * Update `profiles.yml` with your BigQuery Service Account key.
    * Run `dbt build` to run models and tests.
3.  **Streamlit App:**
    * `pip install -r requirements.txt`
    * `streamlit run app.py`

## 📧 Contact
**Your Name** - [Christopher Bonnin - People Analytics Engineer](https://www.linkedin.com/in/christopher-bonnin-a08a95197/) - [Email Address]
