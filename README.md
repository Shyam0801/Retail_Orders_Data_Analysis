# Retail_Orders_Data_Analysis
This project aims to analyze retail orders data retrieved from Kaggle. The dataset contains information about various retail transactions including product details, sales, and regions.

## **Overview**

The project involves the following steps:


**Data Extraction:** The dataset was retrieved from Kaggle using the Kaggle API.

**Data Exploration:** Initial exploration of the dataset was conducted to understand its structure and characteristics.

**Data Cleaning and Standardization:** The dataset has gone through the cleaning and standardization processes to ensure consistency and accuracy.

**Feature Engineering:** Additional columns such as total_sales_price, profit, and discount_price were added to know & analyze more about the data from sales point of view.

**Data Loading:** The cleaned and final dataset was loaded into a Microsoft SQL Server using SQLAlchemy and pandas.

**Querying and Analysis:** SQL queries were performed in SQL Server Management Studio to derive insights and answer specific business questions related to sales and profitability.


## **Questions Answered**

The project addresses the following key questions:


  1. Top Revenue Generating Products: Identifying the top 10 products based on revenue.

  2. Top Selling Products by Region: Determining the top 5 selling products in each region.

  3. Month Over Month Growth Comparison: Analyzing sales growth month-over-month for 2022 and 2023.

  4. Highest Sales Month by Category: Identifying the month with the highest sales for each product category.

  5. Subcategory Profit Growth: Determining the subcategory with the highest profit growth in 2023 compared to 2022.

## **Files**

- [retail_orders_data_analysis.ipynb](https://github.com/Shyam0801/Retail_Orders_Data_Analysis/blob/main/retail_orders_data_analysis.ipynb): Jupyter Notebook containing the data analysis code.
- [retail_orders_data_analysis.sql](https://github.com/Shyam0801/Retail_Orders_Data_Analysis/blob/main/retail_orders_data_analysis.sql): SQL file containing the queries used for analysis.
- [orders.csv](https://github.com/Shyam0801/Retail_Orders_Data_Analysis/blob/main/orders.csv): Raw CSV file, which is extracted from Kaggle API.
- [retail_orders.csv](https://github.com/Shyam0801/Retail_Orders_Data_Analysis/blob/main/retail_orders.csv): Final CSV file, retrieved from the Jupyter Notebook after the data cleaning and other processes.


## **Tools & Technologies Used**

 - Jupyter Notebook
 - Microsoft SQL Server Management Studio
 - SQLALCHEMY is used to connect to jupyter notebook file and the SQL Database to import data
 - Kaggle API is used to retrieve the dataset from Kaggle.

## **Dataset Credits**
[Retail Orders Dataset](https://www.kaggle.com/datasets/ankitbansal06/retail-orders) - Thanks to Ankit Bansal
