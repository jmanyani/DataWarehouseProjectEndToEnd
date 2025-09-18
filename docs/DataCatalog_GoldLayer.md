# Data Catalog for the Gold Layer

## Overview
This catalog describes the structure of the **Gold Layer**, the final destination for our data, optimized for direct use by business teams. It's built on a **star schema** foundation, providing a clear and efficient way to query key business metrics and their related attributes.

---

### 1. **gold.dim_customers**

* **Purpose:** A comprehensive reference table for customer details, enhanced with demographic and location information.

| Field Name | Data Type | Description |
|---|---|---|
| **customer_key** | INT | The unique surrogate identifier for each customer entry in this table. |
| **customer_id** | INT | The primary numeric ID assigned to each customer. |
| **customer_number** | NVARCHAR(50) | An alphanumeric tracking ID for the customer. |
| **first_name** | NVARCHAR(50) | The customer's given name. |
| **last_name** | NVARCHAR(50) | The customer's family name. |
| **country** | NVARCHAR(50) | The country where the customer resides (e.g., 'Australia'). |
| **marital_status** | NVARCHAR(50) | The customer's marital status (e.g., 'Married', 'Single'). |
| **gender** | NVARCHAR(50) | The customer's gender (e.g., 'Male', 'Female'). |
| **birthdate** | DATE | The customer's date of birth in YYYY-MM-DD format. |
| **create_date** | DATE | The timestamp when this customer record was initially created. |

---

### 2. **gold.dim_products**

* **Purpose:** A descriptive table containing attributes for all products.

| Field Name | Data Type | Description |
|---|---|---|
| **product_key** | INT | The unique surrogate identifier for each product entry in the dimension table. |
| **product_id** | INT | The main identifier used for product tracking and inventory. |
| **product_number** | NVARCHAR(50) | A structured code used for product categorization. |
| **product_name** | NVARCHAR(50) | The full, descriptive name of the product. |
| **category_id** | NVARCHAR(50) | The ID that links a product to its high-level classification. |
| **category** | NVARCHAR(50) | The high-level product grouping (e.g., 'Bikes', 'Components'). |
| **subcategory** | NVARCHAR(50) | A more specific product classification. |
| **maintenance_required** | NVARCHAR(50) | A flag indicating whether the product needs maintenance (e.g., 'Yes', 'No'). |
| **cost** | INT | The base price or cost of the product. |
| **product_line** | NVARCHAR(50) | The specific series or family the product belongs to. |
| **start_date** | DATE | The date when the product was first made available for sale. |

---

### 3. **gold.fact_sales**

* **Purpose:** A centralized table for all sales transactions and their corresponding metrics.

| Field Name | Data Type | Description |
|---|---|---|
| **order_number** | NVARCHAR(50) | A unique alphanumeric ID for each sales order. |
| **product_key** | INT | A foreign key linking to the product dimension. |
| **customer_key** | INT | A foreign key linking to the customer dimension. |
| **order_date** | DATE | The date when the purchase order was placed. |
| **shipping_date** | DATE | The date the order was dispatched to the customer. |
| **due_date** | DATE | The date the payment was scheduled for. |
| **sales_amount** | INT | The total monetary value of the sold item. |
| **quantity** | INT | The number of units of the product sold. |
| **price** | INT | The price per unit for the product at the time of sale. |
