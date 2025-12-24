

![image alt](https://github.com/Yweb20/Export-Shipment-Data-Analytics/blob/e94438093e7ba21a3e8ccef2aab5c1eaf7e71931/Trans-shipment-Facility.jpg)


Export Shipment Data Analysis

Overview 📊

This project is a real-world data engineering and analytics assignment designed to analyze export shipment data and generate actionable insights. It demonstrates data extraction, cleaning, transformation, visualization, and reporting skills using Python, SQL, Power BI, and Selenium. The project showcases the end-to-end process from raw data to dashboards, simulating a professional workflow.

---


Dataset 📁

The project uses a shipment dataset containing export shipment details, compliance status, GST, EGM, ports, and other operational data.

Files include:

Cleaned_Final_Shipments.csv – cleaned and processed dataset

Shipment_Analysis.xlsx – contains Pivot tables: Pivot_Port_Status, Pivot_Gateway_GST, Pivot_Port_Gateway; and sorted tables: Sorted_Port_Status, Sorted_Gateway_Second. Additional columns added in Raw_Data sheet 

include:
GST_Compliance_Status → =IF(TRIM(H2)="YES","Compliant","Non-Compliant")

Shipment_Type → =IF(G2="YES","Incentive","Non-Incentive")

PORT_Code → =LEFT(A2,3)

Status_Priority →
Copy code
Excel
=IFS(
  E2="Completed",1,
  E2="Pending",2,
  TRUE,3
)

SB_Year → =YEAR(C2)
Summary folder – containing port summary, status summary, GST summary

Selenium_extracted_data.csv – data extracted via Selenium from the source web portal

Note: The Selenium-extracted CSV is separate for clarity; the code is embedded in the Jupyter notebook.



---


Tools and Technologies 🛠️

Python – data processing and automation

Selenium – web data extraction

Pandas & NumPy – data cleaning and transformation

SQL (MySQL) – database creation, normalization, and queries

Power BI – interactive dashboard and visualizations

Docker – containerized execution of Python scripts

---




Project Steps 📝

Data Extraction
Selenium automation script in data_processing.ipynb fetches shipment data from the web portal.

Extracted data is saved as selenium_extracted_data.csv.

Data Cleaning and Transformation

Raw data cleaned using Pandas in Jupyter notebook.

Generated additional columns like:

GST_Compliance_Status (Compliant / Non-Compliant)

Shipment_Type (Incentive / Non-Incentive)

Port_Code, SB_Year, Status_Priority

SQL Database Creation

Normalized data into three tables: Shipment_Info, Exporter_Compliance, EGM_Info.

Defined primary and foreign keys to maintain relational integrity.

Performed queries to summarize shipments by port, GST compliance, and EGM availability.

Excel Analysis

Pivot tables created for:

Shipment counts by type, port, and year

GST compliance and EGM availability

Excel formulas automated calculation of compliance, priority, and other metrics.

Power BI Dashboard

Visualizations created include:

Donut charts (GST Compliance, EGM Availability)

Clustered column charts (Shipments by Type and Port)

KPI cards for total shipments, compliant shipments, and EGM available

Slicers for PORT, IEC, Status, Gateway, EGM

Dashboard presents an overview of operational metrics and insights.


---

Key Results and Insights 📈

Total Shipments: 379

GST Compliant Shipments: 100% (as per dataset)

EGM Availability: 100% (as per dataset)

Shipment Distribution: Identified top ports and shipment types

Operational Summary: Real-time overview of export compliance and logistics efficiency



---


How to Run the Project ⚡

Using Docker

Build the Docker image:

Copy code

Bash

docker build -t data-processor .

Run the container:

Copy code

Bash

docker run --rm -v "%cd%":/app data-processor

Output files (e.g., processed_output.csv) will be generated in your local folder.

Using Jupyter Notebook

Open data_processing.ipynb in Jupyter Lab or Notebook.

Execute cells sequentially to:

Load and clean datasets

Perform transformations

Save processed CSV files

Power BI Dashboard

Open PowerBI_Dashboard.pbix file.

Refresh data if needed, interact with slicers, and explore visual insights.



---

Selenium Section 🕸️

Selenium automation code is included inside the data_processing.ipynb notebook.

It extracts shipment data from the source web portal and saves it as selenium_extracted/extracted_shipments.csv.

This ensures the process and output are reproducible.


---


License
This project is licensed under the MIT License.
