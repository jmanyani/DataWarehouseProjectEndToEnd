Here's the complete, copy-and-paste-ready Markdown text for the Naming Conventions document. You can save this directly into a file with a `.md` extension.

```markdown
# Data Warehouse Naming Conventions

This document outlines the standard naming conventions for schemas, tables, views, columns, and other objects within the data warehouse. Adhering to these guidelines ensures consistency, readability, and maintainability across the entire data platform.

---

## General Principles

* **Style:** All object names must use **snake_case**, consisting of lowercase letters and underscores (`_`) to separate words.
* **Language:** All names must be in English.
* **Reserved Words:** Avoid using SQL reserved words as object names to prevent syntax errors and conflicts.

---

## Table Naming Conventions

Table naming follows a layered approach, reflecting the data's journey through the medallion architecture.

### Bronze Rules

Tables in the Bronze layer serve as a raw data landing zone. Their names are a combination of the source system and the original table name, ensuring a direct and transparent lineage.

**Pattern:** `<sourcesystem>_<entity>`

* **`<sourcesystem>`**: The name of the data source (e.g., `crm`, `erp`).
* **`<entity>`**: The exact original table name from the source system.

**Example:** `crm_customer_info` (Customer data from the CRM system)

### Silver Rules

Tables in the Silver layer are the cleaned and standardized versions of the Bronze tables. The naming convention remains the same as in the Bronze layer to preserve the direct relationship to the source.

**Pattern:** `<sourcesystem>_<entity>`

* **`<sourcesystem>`**: The name of the data source (e.g., `crm`, `erp`).
* **`<entity>`**: The exact original table name from the source system.

**Example:** `crm_customer_info` (Cleaned customer data from the CRM system)

### Gold Rules

Tables in the Gold layer are optimized for business intelligence and reporting. Their names are prefixed to indicate their role, making them easy for business users to identify.

**Pattern:** `<category>_<entity>`

* **`<category>`**: A prefix describing the table's purpose, such as `dim` for a dimension table or `fact` for a fact table.
* **`<entity>`**: A clear, descriptive name of the business entity (e.g., `customers`, `products`, `sales`).

**Examples:**
* `dim_customers` (A dimension table containing customer data)
* `fact_sales` (A fact table containing sales transactions)

#### Category Glossary

| Pattern | Meaning | Example(s) |
|---|---|---|
| `dim_` | Dimension table | `dim_customer`, `dim_product` |
| `fact_` | Fact table | `fact_sales` |
| `report_` | Report table | `report_customers`, `report_sales_monthly` |

---

## Column Naming Conventions

Column naming ensures that a column's purpose is immediately clear, especially for keys and technical metadata.

### Surrogate Keys

Surrogate keys, used as primary keys in dimension tables, must use a consistent suffix.

**Pattern:** `<table_name>_key`

* **`<table_name>`**: The name of the table the key belongs to.
* **`_key`**: A suffix that clearly identifies the column as a surrogate key.

**Example:** `customer_key` (The surrogate key for the `dim_customers` table)

### Technical Columns

System-generated metadata columns must be prefixed to distinguish them from business data.

**Pattern:** `dwh_<column_name>`

* **`dwh_`**: A prefix exclusively for data warehouse metadata.
* **`<column_name>`**: A descriptive name indicating the column's purpose.

**Example:** `dwh_load_date` (The date a record was loaded into the warehouse)

---

## Stored Procedure Naming

Stored procedures for data loading must follow a simple, descriptive pattern.

**Pattern:** `load_<layer>`

* **`load_`**: The prefix indicating the procedure's function is to load data.
* **`<layer>`**: The specific data warehouse layer the procedure loads into.

**Examples:**
* `load_bronze` (Loads data into the Bronze layer)
* `load_silver` (Loads data into the Silver layer)
```
