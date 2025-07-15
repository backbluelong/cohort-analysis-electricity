# 📊 Cohort Analysis for Electricity Customers

This project performs a **Cohort Analysis** on electricity customers using SQL and Python.

## 🧠 Objective
To understand customer retention behavior after their first purchase using monthly cohort tracking.

## 📦 Dataset
Extracted from an SQL database of electricity product purchases. The Excel file includes cohort-tagged retention rates.

## 🛠️ Tools & Technologies
- SQL Server (for data extraction)
- Python (pandas, matplotlib, seaborn)
- Jupyter Notebook
- Excel (intermediate data storage)

## 📂 Project Structure
cohort-analysis-electricity/
├── data/ # exported Excel file from SQL
│ └── cohort_retention.xlsx
├── notebooks/ # main analysis notebook
│ └── cohort_analysis.ipynb
├── outputs/ # final visualizations (heatmap)
│ └── cohort_retention_heatmap.png
├── .gitignore # ignore venv, pycache, etc.
└── README.md # project documentation

## 📈 Output

![Cohort retention heatmap](outputs/cohort_retention_heatmap.png)

The heatmap shows customer retention percentages by cohort month over time.

## 🚀 How to Run

1. Clone this repository
2. Open the Jupyter notebook: `notebooks/cohort_analysis.ipynb`
3. Install necessary packages:
   ```bash
   pip install pandas matplotlib seaborn openpyxl

4.   Run all cells

📌 Notes
This project is part of my data analytics learning journey. Feedback is welcome!



