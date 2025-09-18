# Data Warehouse Naming Conventions

This document outlines the standard naming conventions for schemas, tables, views, columns, and other objects within the data warehouse. Adhering to these guidelines ensures consistency, readability, and maintainability across the entire data platform.

---

## General Principles
- **Style**: All object names must use `snake_case`, consisting of lowercase letters and underscores (`_`) to separate words.  
- **Language**: All names must be in English.  
- **Reserved Words**: Avoid using SQL reserved words as object names to prevent syntax errors and conflicts.  

---

## Table Naming Conventions

Table naming follows a layered approach, reflecting the data's journey through the **Medallion Architecture**.

### Bronze Layer
- **Purpose**: Raw data landing zone.  
- **Pattern**:  
<sourcesystem>_<entity>

markdown
Copy code
- `<sourcesystem>`: The name of the data source (e.g., `crm`, `erp`).  
- `<entity>`: The exact original table name from the source system.  
- **Example**:  
crm_customer_info


### Silver Layer
- **Purpose**: Cleaned and standardized versions of Bronze tables.  
- **Pattern**:  
<sourcesystem>_<entity>

markdown
Copy code
- **Example**:  
crm_customer_info


### Gold Layer
- **Purpose**: Optimized for BI and reporting.  
- **Pattern**:  
<category>_<entity>


- `<category>`: A prefix describing the table's purpose (`dim`, `fact`, `report`).  
- `<entity>`: A descriptive name of the business entity.  

- **Examples**:  
dim_customers
fact_sales
report_sales_monthly


---

## Category Glossary

| Prefix   | Meaning            | Example(s)               |
|----------|--------------------|--------------------------|
| `dim_`   | Dimension table    | `dim_customer`, `dim_product` |
| `fact_`  | Fact table         | `fact_sales`             |
| `report_`| Report table       | `report_customers`, `report_sales_monthly` |

---

## Column Naming Conventions

### Surrogate Keys
- **Pattern**:  
<table_name>_key

markdown
Copy code
- **Example**:  
customer_key


### Technical Columns
- **Pattern**:  
dwh_<column_name>


- **Example**:  
dwh_load_date



---

## Stored Procedure Naming

Stored procedures for data loading must follow a simple, descriptive pattern.

- **Pattern**:  
load_<layer>


- **Examples**:  
load_bronze
load_silver


---
